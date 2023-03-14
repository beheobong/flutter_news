import 'package:care_box/core/api_client.dart';
import 'package:care_box/pages/match/matchs_response_model.dart';
import 'package:flutter/material.dart';


class MatchsApiClient extends ApiClient {
  MatchsApiClient(BuildContext contex) : super(contex);

  Future matchs() async {
    // final query = {
    //   'q': 'th%E1%BB%83%20thao',
    //   'from': f.format(DateTime.now().subtract(const Duration(days: 31))),
    //   'sortBy': 'publishedAt',
    //   'apiKey': '4ae78fa070d34ae9b026256945b26038',
    // };
    String link = "http://8.219.96.182:1990/clone/calendar";
    final res = await api.methodGet(api: link);
    // final res = await api.methodGet(api: ApiConfig.home, queries: query,);
    if (res['success'] == true) {
      return MatchsResponseModelList.fromJson(res['data']).list;
    }
    return errorHandle(res);
  }
}





// class MatchsApiClient extends ApiClient {
//   MatchsApiClient(BuildContext context) : super(context);

//   Future matchs() async {
//     if (kDebugMode) {
//       print("Matchs call API");
//     }
//     String url = "http://api.cup2022.ir/api/v1/user/login";
//     final res = await Dio().post(
//       url,
//       data: <String, String>{
//         "email": "nguyen1@gmail.com",
//         "password": "12345678",
//       },
//     );
//     try {
//       if (res.data != null) {
//         final tokenRes = TokenResponseModel.fromJson(res.data);
//         final TokenModel? token = tokenRes.data;
//         if (token != null) {
//           SharedPrefs.instance.saveAccessToken(token);
//           if (kDebugMode) {
//             print(token.token);
//           }
//         }
//       }
//     } catch (e) {}
//     ;
//     TokenModel? tokenGet = await SharedPrefs.instance.accessToken;
//     if (tokenGet != null) {
//       if (kDebugMode) {
//         print("Get Token");
//       }
//       if (kDebugMode) {
//         print(tokenGet.token);
//       }
//     } else {
//       return errorHandle(<String, dynamic>{});
//     }

//     String urlMatchs = "http://api.cup2022.ir/api/v1/match";
//     final resMatchs = await Dio().get(
//       urlMatchs,
//       options: Options(headers: {
//         "Authorization": "Bearer ${tokenGet.token}",
//         "Content-Type": "application/json",
//       }, validateStatus: (_) => true),
//     );
//     if (resMatchs.data != null) {
//       if (kDebugMode) {
//         print(resMatchs.data);
//       }
//       final model = MatchsResponseModel.fromJson(resMatchs.data);
//       if (kDebugMode) {
//         print("count model");
//       }
//       if (kDebugMode) {
//         print(model.data?.length);
//       }
//       return model.data;
//     }
//     return errorHandle(resMatchs.extra);
//   }
// }
