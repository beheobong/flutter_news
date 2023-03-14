import 'dart:convert';

import 'package:care_box/helpers/app_style.dart';
import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

class TargetView extends StatelessWidget {
  const TargetView({Key? key, this.text, required this.title})
      : super(key: key);

  final String? text;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (text == null) return const SizedBox.shrink();
    List list = [];
    if (text!.contains('[') && text!.contains(']')) {
      try {
        final abc = jsonDecode(text!);
        if (abc is String) {
          list = jsonDecode(abc);
        } else {
          list = abc;
        }
      } catch (e) {
        list.add(text);
        debugPrint('$e');
      }
    } else {
      list.add(text);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(title),
        const SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              list.length,
              (index) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('assets/icons/ic_case.png'),
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            list[index],
                            style: Styles.copyStyle(
                                fontSize: AppStyle.largeTextSize,
                                color: AppStyle.textGrey,
                                height: 1.2),
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
        ),
      ],
    );
  }

  Widget _title(String text, {bool isIcon = true}) {
    return Row(
      children: [
        Text(
          text,
          style: Styles.copyStyle(
            fontSize: 16,
            color: AppStyle.textGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Icon(Icons.arrow_drop_down_sharp,
            size: 24, color: isIcon ? AppStyle.textGrey : Colors.transparent)
      ],
    );
  }
}
