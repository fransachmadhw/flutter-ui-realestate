import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';

class PrimaryInput extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final bool? isPassword;
  final TextInputType? textInputType;

  const PrimaryInput(
      {super.key,
      this.label,
      this.placeholder,
      this.isPassword,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    FontSize().init(context);
    return TextField(
      style:
          TextStyle(fontSize: FontSize.blockSizeHorizontal! * 4, color: white),
      decoration: InputDecoration(
        fillColor: white,
        focusColor: grey500,
        counterText: "",
        floatingLabelStyle: TextStyle(
            fontSize: FontSize.blockSizeHorizontal! * 4,
            fontWeight: FontWeight.bold),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label ?? "",
        hintText: placeholder ?? "",
        labelStyle: TextStyle(
            color: white,
            fontSize: FontSize.blockSizeHorizontal! * 4,
            fontWeight: FontWeight.bold),
        hintStyle: TextStyle(
            fontSize: FontSize.blockSizeHorizontal! * 3.6, color: grey500),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: grey500, width: 1),
          borderRadius: BorderRadius.circular(0),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: grey500, width: 1),
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      obscureText: isPassword ?? false,
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: TextInputAction.done,
    );
  }
}
