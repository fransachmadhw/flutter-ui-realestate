import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/pages/auth/login_page1.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/custom_text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Real Estate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        textTheme: customTextStyle,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primary500,
              onPrimary: primary500,
              secondary: grey500,
            ),
      ),
      home: const LoginPage1(),
    );
  }
}
