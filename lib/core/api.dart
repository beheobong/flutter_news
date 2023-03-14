import 'dart:async';
// import 'package:care_box/models/user_model.dart';
// import 'package:care_box/models/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/cupertino.dart';

import 'api_config.dart';
import 'constant.dart';

class Api with LoggerPresenter {
  Api(this.context) {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      receiveTimeout: 60000,
      connectTimeout: 60000,
    ));
  }

  late Dio _dio;
  final BuildContext context;
  // Map<String, CancelToken> canquest = {};

  //  UserModel? get user => UserRepository.instance.user;

  Future requestApi(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      bool refeshToken = true}) async {
    try {
      // if (user?.userToken != null) {
      //   if (options?.headers == null) {
      //     options!.headers = {};
      //   }
      //   options!.headers!['authorization'] = 'Bearer ' + user!.userToken!;
      // }
      if (Constanst.isShowLogRequest) {
        logger.i('path $path');
        logger.w('requestApiheaders ${options!.headers}');
        if (data is FormData) {
          for (MapEntry item in data.fields) {
            logger.w('data ${item.toString()}');
          }
          for (MapEntry item in data.files) {
            logger.w('data ${item.toString()}');
          }
        } else {
          logger.w('data $data');
        }
        logger.w('queryParameters $queryParameters');
        logger.w('requestApiheaders ${options.headers}');
      }
      // CancelToken cancelToken = CancelToken();
      // canquest[path] = cancelToken;
      Response response = await _dio.request(
        path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        // cancelToken: cancelToken,
      );

      final res = response.data;
      if (Constanst.isShowLogRequest) {
        logger.i('path $path');
        logger.w('requestApiheaders ${options!.headers}');
        if (data is FormData) {
          for (MapEntry item in data.fields) {
            logger.w('data ${item.toString()}');
          }
          for (MapEntry item in data.files) {
            logger.w('data ${item.toString()}');
          }
        } else {
          logger.w('data $data');
        }
        logger.w('queryParameters $queryParameters');
        logger.w('requestApiheaders ${options.headers}');

        logger.e('requestApires $res');
      }
      // if (res['message'] == 'jwt expired' &&
      //     user != null &&
      //     refeshToken) {
      //   Response respo = await Dio().post(ApiConfig.refreshToken,
      //       data: {
      //         'refresh_token': user!.refreshToken,
      //       },
      //       options: Options(
      //           followRedirects: false,
      //           validateStatus: (status) {
      //             return status! < 500;
      //           },
      //           method: 'POST',
      //           responseType: ResponseType.json));
      //   final result = respo.data;
      //   if (Constanst.isShowLogRequest) {
      //     logger.w('RefreshToken  $result');
      //   }
      //   if (result['success']) {
      //     user!
      //       ..userToken = result['data']['token']
      //       ..refreshToken = result['data']['refresh_token'];
      //     user!.save();
      //     return requestApi(
      //       path,
      //       data: data,
      //       queryParameters: queryParameters,
      //       options: options,
      //       onSendProgress: onSendProgress,
      //       onReceiveProgress: onReceiveProgress,
      //     );
      //   } else {
      //     if (refeshToken) {
      //       UserRepository.instance.logout();
      //       Navigator.of(context).popUntil((route) => route.isFirst);
      //     }
      //   }
      // }
      return res;
    } catch (e, stack) {
      logger.e('Exception occured: $e - $stack');
      return _handleError(e);
    }
  }

  Map<String, dynamic> _handleError(error) {
    String errorDescription = '';
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          errorDescription = 'Hết thời gian kết nối máy chủ';
          break;
        case DioErrorType.cancel:
          errorDescription = 'S.current.request_to_the_server_was_canceled';
          break;
        case DioErrorType.connectTimeout:
          errorDescription = 'S.current.server_connect_time_out';
          break;
        case DioErrorType.other:
          errorDescription =
              'S.current.conn_to_server_fail_due_to_internet_conn';
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = 'S.current.m64';
          break;
        case DioErrorType.response:
          errorDescription = 'S.current.m64: ${error.response?.statusCode}';
          break;
        default:
          errorDescription = error.message;
          break;
      }
    } else {
      errorDescription = error.message;
    }

    return {
      'success': false,
      'message': errorDescription,
      'code': error?.response?.statusCode,
      'errorType': error.model
    };
  }

  Future methodGet(
      {required String api,
      Map<String, dynamic>? queries,
      bool refeshToken = true}) {
    return requestApi(api,
        queryParameters: queries,
        options: Options(method: 'GET', responseType: ResponseType.json),
        refeshToken: refeshToken);
  }

  Future methodPost(
      {required String api,
      Object? body,
      Function(int, int)? onSendProgress,
      bool refeshToken = true}) {
    return requestApi(api,
        data: body,
        options: Options(method: 'POST', responseType: ResponseType.json),
        onSendProgress: onSendProgress,
        refeshToken: refeshToken);
  }

  Future methodPut(
      {required String api,
      Object? body,
      Function(int, int)? onSendProgress,
      bool refeshToken = true}) {
    return requestApi(api,
        data: body,
        options: Options(method: 'PUT', responseType: ResponseType.json),
        onSendProgress: onSendProgress,
        refeshToken: refeshToken);
  }

  Future methodDel(
      {required String api,
      Map<String, dynamic>? query,
      Object? body,
      bool refeshToken = true}) {
    return requestApi(api,
        data: body,
        queryParameters: query,
        options: Options(method: 'DELETE', responseType: ResponseType.json),
        refeshToken: refeshToken);
  }

  Future methodPatch(
      {required String api,
      Object? body,
      Function(int, int)? onSendProgress,
      bool refeshToken = true}) {
    return requestApi(api,
        data: body,
        options: Options(method: 'PATCH', responseType: ResponseType.json),
        onSendProgress: onSendProgress,
        refeshToken: refeshToken);
  }

  void cancelRequest() {
    // if (canquest.isNotEmpty) {
    //   canquest.forEach((key, value) {
    //     value.cancel();
    //   });
    //   canquest.clear();
    // }
  }
}
