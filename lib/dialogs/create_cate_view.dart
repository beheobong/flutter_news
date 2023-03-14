import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

class CreateCateView extends StatelessWidget {
  CreateCateView({Key? key, required this.title, required this.onCreate})
      : super(key: key);

  final String title;
  final ValueChanged<String> onCreate;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(title, style: Styles.copyStyle()),
          TextField(
            controller: controller,
          ),
          Row(
            children: [
              Expanded(
                child: BtnView(
                  onPress: () {
                    Navigator.of(context).pop();
                  },
                  title: 'Đóng',
                ),
              ),
              const SizedBox(),
              Expanded(
                child: BtnView(
                  onPress: () => _onCreate(context),
                  title: 'Tạo',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onCreate(BuildContext context) {
    if (controller.text.trim().isEmpty) {
      Utils.showToast('Vui lòng nhập tên danh mục');
      return;
    }
    Navigator.of(context).pop();
    onCreate(controller.text.trim());
  }
}
