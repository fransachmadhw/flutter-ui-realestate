import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FontSize().init(context);
    return Scaffold(
      backgroundColor: dark500,
      body: SafeArea(
        child: Text(
          "Home Page",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: white,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              fontSize: FontSize.blockSizeHorizontal! * 6),
        ),
      ),
    );
  }
}
