import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_realestate/controllers/main_app_controller.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';
import 'package:get/get.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FontSize().init(context);
    return GetX<MainAppController>(
      init: MainAppController(),
      builder: (controller) => Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            toolbarHeight: 0,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: dark500,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            )),
        body: controller.pages[controller.currentPageIndex.value],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomNavigationBar(
          isFloating: true,
          backgroundColor: darkSecond,
          borderRadius: Radius.circular(radius),
          unSelectedColor: grey200,
          strokeColor: primary500,
          scaleFactor: 0.2,
          items: [
            CustomNavigationBarItem(
                icon: Center(
                    child: SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter: controller.currentPageIndex.value == 0
                  ? ColorFilter.mode(
                      primary500,
                      BlendMode.srcIn,
                    )
                  : ColorFilter.mode(
                      grey200,
                      BlendMode.srcIn,
                    ),
              width: FontSize.blockSizeHorizontal! * 5,
            ))),
            CustomNavigationBarItem(
                icon: Center(
                    child: SvgPicture.asset(
              'assets/icons/heart.svg',
              colorFilter: controller.currentPageIndex.value == 1
                  ? ColorFilter.mode(
                      primary500,
                      BlendMode.srcIn,
                    )
                  : ColorFilter.mode(
                      grey200,
                      BlendMode.srcIn,
                    ),
              width: FontSize.blockSizeHorizontal! * 5,
            ))),
            CustomNavigationBarItem(
                icon: Center(
                    child: SvgPicture.asset(
              'assets/icons/notification.svg',
              colorFilter: controller.currentPageIndex.value == 2
                  ? ColorFilter.mode(
                      primary500,
                      BlendMode.srcIn,
                    )
                  : ColorFilter.mode(
                      grey200,
                      BlendMode.srcIn,
                    ),
              width: FontSize.blockSizeHorizontal! * 5,
            ))),
            CustomNavigationBarItem(
                icon: Center(
                    child: SvgPicture.asset(
              'assets/icons/account.svg',
              colorFilter: controller.currentPageIndex.value == 3
                  ? ColorFilter.mode(
                      primary500,
                      BlendMode.srcIn,
                    )
                  : ColorFilter.mode(
                      grey200,
                      BlendMode.srcIn,
                    ),
              width: FontSize.blockSizeHorizontal! * 5,
            ))),
          ],
          currentIndex: controller.currentPageIndex.value,
          onTap: (index) => controller.setPageIndex(index),
        ),
      ),
    );
  }
}
