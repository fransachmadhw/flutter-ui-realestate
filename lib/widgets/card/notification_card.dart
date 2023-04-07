import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';
import 'package:gap/gap.dart';

class NotificationCard extends StatelessWidget {
  final String image;
  final String title;
  final String time;
  final String desc;
  final bool isRead;
  const NotificationCard(
      {super.key,
      required this.image,
      required this.title,
      required this.time,
      required this.desc,
      required this.isRead});

  @override
  Widget build(BuildContext context) {
    FontSize().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          child: Container(
              width: FontSize.blockSizeHorizontal! * 92,
              // decoration: BoxDecoration(color: darkSecond),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return primary500;
                      }
                      return darkSecond;
                    },
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: spacing * 2,
                          top: spacing * 2,
                          bottom: spacing * 2),
                      child: Container(
                        width: FontSize.blockSizeHorizontal! * 18,
                        height: FontSize.blockSizeHorizontal! * 18,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(image), fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(radius))),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                                top: -3,
                                left: -3,
                                child: Container(
                                  width: FontSize.blockSizeHorizontal! * 3.2,
                                  height: FontSize.blockSizeHorizontal! * 3.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(radius * 10),
                                      ),
                                      color: !isRead
                                          ? primary500
                                          : Colors.transparent),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width: FontSize.blockSizeHorizontal! * 65,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: spacing * 2,
                              right: spacing * 2,
                              bottom: spacing * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: FontSize.blockSizeHorizontal! * 34,
                                    child: Text(title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                                color: white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                                fontSize: FontSize
                                                        .blockSizeHorizontal! *
                                                    3.5)),
                                  ),
                                  Text(time,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              color: !isRead
                                                  ? primary500
                                                  : grey500,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                              fontSize: FontSize
                                                      .blockSizeHorizontal! *
                                                  3.5))
                                ],
                              ),
                              Gap(spacing),
                              Text(desc,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                          color: grey500,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.5,
                                          fontSize:
                                              FontSize.blockSizeHorizontal! *
                                                  3.5))
                            ],
                          ),
                        ))
                  ],
                ),
              )),
        )
      ],
    );
  }
}
