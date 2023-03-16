import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';
import 'package:flutter_ui_realestate/pages/auth/forgot_password1.dart';
import 'package:flutter_ui_realestate/pages/main/main_app.dart';
import 'package:flutter_ui_realestate/widgets/button/primary_button.dart';
import 'package:flutter_ui_realestate/widgets/input/primary_input.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
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
            height: FontSize.blockSizeVertical! * 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/BG1.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: FontSize.blockSizeVertical! * 58,
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
                        Text("Welcome Back!",
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
                        Text("Enter your password",
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
                          placeholder: "Your Password",
                          label: "PASSWORD",
                          isPassword: true,
                        ),
                        Gap(spacing * 3),
                        PrimaryButton(
                          onPressed: () => Get.to(() => MainApp(),
                              transition: Transition.cupertinoDialog,
                              duration: const Duration(milliseconds: 500)),
                          title: "Login",
                          isLoading: false,
                          type: ButtonType.primary,
                        ),
                        Gap(spacing),
                        Text("or",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: grey500,
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3.6)),
                        Gap(spacing),
                        PrimaryButton(
                          onPressed: () => Get.to(() => ForgotPassword1(),
                              transition: Transition.cupertinoDialog,
                              duration: const Duration(milliseconds: 500)),
                          title: "Forgot password",
                          isLoading: false,
                          type: ButtonType.secondary,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: RichText(
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        text: TextSpan(
                            text: "By signing in you agree to our ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: grey500,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3),
                            children: [
                              TextSpan(
                                text: " Terms of Service",
                                style: TextStyle(color: primary500),
                              ),
                            ]),
                      ),
                    ),
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
