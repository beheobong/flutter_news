import 'package:dudv_base/themes/styles.dart';
import 'package:flutter/material.dart';

import 'app_style.dart';

class DialogHelper {
  static final DialogHelper instance = DialogHelper._init();
  DialogHelper._init();

  void dialogCourse(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Bạn muốn rời khỏi?',
                  style: Styles.copyStyle(
                      color: AppStyle.black303030,
                      fontSize: AppStyle.largeTextSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Bạn có thể truy cập lại khoá học nhanh chóng tại Trang chủ > Tiếp tục hoạt động.',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Styles.copyStyle(
                    color: AppStyle.black303030,
                    fontSize: AppStyle.normalTextSize,
                    height: 1.5),
              ),
              const SizedBox(height: 15),
              Container(height: 1, color: AppStyle.greyE9),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xffCE3737),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Rời khỏi',
                        style: Styles.copyStyle(
                            color: Colors.white,
                            fontSize: AppStyle.largeTextSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: AppStyle.blue2891B5,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Tiếp tục',
                        style: Styles.copyStyle(
                            color: Colors.white,
                            fontSize: AppStyle.largeTextSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 15)
            ],
          ),
        );
      },
    );
  }

  Future showConfirm(
      {required BuildContext context,
      String? title,
      String? content,
      String? tvNo,
      String? tvYes,
      int type = 0}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  title ?? 'Xác nhận rời khỏi',
                  style: Styles.copyStyle(
                      color: AppStyle.black303030,
                      fontSize: AppStyle.largeTextSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  content ??
                      'Nội dung chat sẽ xoá hoàn toàn và không lưu lại bản ghi. Bạn có muốn thoát',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Styles.copyStyle(
                      color: AppStyle.black303030,
                      fontSize: AppStyle.normalTextSize,
                      height: 1.5),
                ),
              ),
              const SizedBox(height: 15),
              Container(height: 1, color: AppStyle.greyE9),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: type == 0
                              ? Colors.transparent
                              : AppStyle.redCE3737,
                          border: Border.all(
                            color: type == 0
                                ? AppStyle.blue2891B5
                                : Colors.transparent,
                            width: 1,
                          )),
                      child: Center(
                        child: Text(
                          tvNo ?? 'Thoát',
                          style: Styles.copyStyle(
                            color:
                                type == 0 ? AppStyle.blue2891B5 : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: AppStyle.blue2891B5,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          tvYes ?? 'Ở lại',
                          style: Styles.copyStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 15)
            ],
          ),
        );
      },
    );
  }
}
