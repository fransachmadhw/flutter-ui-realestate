import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    FontSize().init(context);
    return Scaffold(
      backgroundColor: dark500,
      body: SafeArea(
          child: Center(
        child: Text(
          "Account Page",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: white,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              fontSize: FontSize.blockSizeHorizontal! * 6),
        ),
      )),
    );
  }
}
