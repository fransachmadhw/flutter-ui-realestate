import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    FontSize().init(context);
    return Scaffold(
      backgroundColor: dark500,
      body: SafeArea(
          child: Center(
        child: Text(
          "Notification Page",
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
