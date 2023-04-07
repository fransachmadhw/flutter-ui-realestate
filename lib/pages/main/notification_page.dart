import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';
import 'package:flutter_ui_realestate/widgets/card/notification_card.dart';
import 'package:gap/gap.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    FontSize().init(context);
    return WillPopScope(
        child: Scaffold(
          backgroundColor: dark500,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(spacing * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Gap(spacing),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Notification",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: white,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.5,
                                        fontSize:
                                            FontSize.blockSizeHorizontal! * 6)),
                            InkWell(
                              child: Text("Mark all as read",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                          color: primary500,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.5,
                                          fontSize:
                                              FontSize.blockSizeHorizontal! *
                                                  4)),
                            )
                          ],
                        ),
                        Gap(spacing * 2),
                      ],
                    ),
                  ),
                  NotificationCard(
                      image: "assets/images/apartment1-image1.jpg",
                      title: "ROSA by Kozystay Private Lift",
                      time: "5 min ago",
                      isRead: false,
                      desc:
                          "Your booking payment period will be expired in 3 days."),
                  Gap(spacing * 2),
                  NotificationCard(
                      image: "assets/images/apartment4-image1.jpg",
                      title: "Treehouse Suites Boutique Serviced",
                      time: "3 days ago",
                      isRead: false,
                      desc: "Successfully booked. Please enjoy!"),
                  Gap(spacing * 2),
                  NotificationCard(
                      image: "assets/images/apartment5-image1.jpg",
                      title: "Apartment Salemba Modern 2BR",
                      time: "A month ago",
                      isRead: false,
                      desc:
                          "Thank you for your feedback. The owner will soon contact you for more detail information."),
                  Gap(spacing * 2),
                  NotificationCard(
                      image: "assets/images/apartment3-image1.jpg",
                      title: "Apartment East Casablanca 2BR",
                      time: "A month ago",
                      isRead: true,
                      desc:
                          "Thank you for your feedback. The owner will soon contact you for more detail information."),
                  Gap(spacing * 2),
                  NotificationCard(
                      image: "assets/images/apartment7-image1.jpg",
                      title: "1BR Apartment at 18 Residence",
                      time: "2 months ago",
                      isRead: true,
                      desc:
                          "Thank you for your feedback. The owner will soon contact you for more detail information."),
                  Gap(spacing * 2),
                  NotificationCard(
                      image: "assets/images/apartment8-image1.jpg",
                      title: "Modern 2BR Apartment at FX Residence",
                      time: "3 months ago",
                      isRead: true,
                      desc:
                          "Thank you for your feedback. The owner will soon contact you for more detail information."),
                  SizedBox(height: spacing * 12)
                ],
              ),
            ),
          ),
        ),
        onWillPop: _onWillPop);
  }
}
