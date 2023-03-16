import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';
import 'package:flutter_ui_realestate/pages/auth/login_page1.dart';
import 'package:flutter_ui_realestate/widgets/button/primary_button.dart';
import 'package:flutter_ui_realestate/widgets/input/primary_input.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgotPassword3 extends StatefulWidget {
  const ForgotPassword3({super.key});

  @override
  State<ForgotPassword3> createState() => _ForgotPassword3();
}

class _ForgotPassword3 extends State<ForgotPassword3> {
  @override
  Widget build(BuildContext context) {
    FontSize().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          )),
      backgroundColor: dark500,
      body: Stack(
        children: [
          Container(
            height: FontSize.blockSizeVertical! * 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/BG3.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: FontSize.blockSizeVertical! * 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: dark500,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  )),
              child: Padding(
                padding: EdgeInsets.all(spacing * 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Gap(spacing * 2),
                        Text("Set new password",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 6.2)),
                        Gap(spacing * 1),
                        Text(
                            "Enter the new password you would use and try login",
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: grey500,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 4)),
                        Gap(spacing * 2),
                        PrimaryInput(
                          placeholder: "Your new password",
                          label: "PASSWORD",
                          isPassword: true,
                        ),
                        Gap(spacing * 2),
                        PrimaryInput(
                          placeholder: "Repeat your new password",
                          label: "REPEAT PASSWORD",
                          isPassword: true,
                        ),
                        Gap(spacing * 3),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PrimaryButton(
                          onPressed: () => Get.to(() => LoginPage1(),
                              transition: Transition.cupertinoDialog,
                              duration: const Duration(milliseconds: 500)),
                          title: "Reset Password",
                          isLoading: false,
                          type: ButtonType.primary,
                        ),
                        SizedBox(
                          height: spacing * 3,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
