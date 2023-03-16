import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';
import 'package:flutter_ui_realestate/pages/auth/forgot_password3.dart';
import 'package:flutter_ui_realestate/widgets/button/primary_button.dart';
import 'package:flutter_ui_realestate/widgets/input/pin_input.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgotPassword2 extends StatefulWidget {
  const ForgotPassword2({super.key});

  @override
  State<ForgotPassword2> createState() => _ForgotPassword2();
}

class _ForgotPassword2 extends State<ForgotPassword2> {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(spacing * 2),
                        Text("Enter the pin code",
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
                        Text("Enter the pin code you received by text message",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PinInput(),
                            Gap(spacing * 3),
                            PinInput(),
                            Gap(spacing * 3),
                            PinInput(),
                            Gap(spacing * 3),
                            PinInput()
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PrimaryButton(
                          onPressed: () => Get.to(() => ForgotPassword3(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 500)),
                          title: "Next step",
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
