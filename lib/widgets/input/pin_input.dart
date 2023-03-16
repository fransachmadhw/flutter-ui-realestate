import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';

class PinInput extends StatelessWidget {
  const PinInput({super.key});

  @override
  Widget build(BuildContext context) {
    FontSize().init(context);
    return Expanded(
        child: TextField(
      textAlign: TextAlign.center,
      style:
          TextStyle(fontSize: FontSize.blockSizeHorizontal! * 7, color: white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: grey500, width: 1),
          borderRadius: BorderRadius.circular(100),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: grey500, width: 1),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      textInputAction: TextInputAction.done,
    ));
  }
}
