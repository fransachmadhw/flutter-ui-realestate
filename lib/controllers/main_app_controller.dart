import 'package:flutter_ui_realestate/pages/main/account_page.dart';
import 'package:flutter_ui_realestate/pages/main/favourite_page.dart';
import 'package:flutter_ui_realestate/pages/main/home_page.dart';
import 'package:flutter_ui_realestate/pages/main/notification_page.dart';
import 'package:get/get.dart';

class MainAppController extends GetxController {
  RxInt currentPageIndex = 0.obs;
  final pages = [
    HomePage(),
    const FavouritePage(),
    const NotificationPage(),
    AccountPage()
  ];

  void setPageIndex(int index) {
    currentPageIndex.value = index;
  }
}
