import 'package:dudv_base/dudv_base.dart';
import 'package:flutter/material.dart';

class FormInputAuthView extends StatelessWidget {
  final String? hinText;
  const FormInputAuthView({Key? key, this.hinText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: Styles.copyStyle(),
        // contentPadding: EdgeInsets.symmetric(horizontal: 15)),
      ),
    );
  }
}
