import 'package:flutter/material.dart';
import 'package:flutter_ui_realestate/controllers/main_app_controller.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';
import 'package:flutter_ui_realestate/pages/main/detail_page.dart';
import 'package:flutter_ui_realestate/states/apartments.dart';
import 'package:flutter_ui_realestate/widgets/input/rounded_search.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:country_flags/country_flags.dart';

class HomePage extends StatelessWidget {
  final Apartments _testAja = Get.put(Apartments());
  HomePage({super.key});

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    MainAppController pageController = Get.put(MainAppController());
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
                      padding: EdgeInsets.only(
                          left: spacing * 2,
                          top: spacing * 2,
                          bottom: spacing * 2,
                          right: spacing * 0.2),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hi, Franz!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize:
                                                FontSize.blockSizeHorizontal! *
                                                    8,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          )),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Jakarta, Indonesia",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                color: lightGrey500,
                                                fontSize: FontSize
                                                        .blockSizeHorizontal! *
                                                    4,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0.5,
                                              )),
                                      Gap(spacing / 1.2),
                                      CountryFlags.flag(
                                        'id',
                                        height:
                                            FontSize.blockSizeHorizontal! * 4,
                                        width:
                                            FontSize.blockSizeHorizontal! * 5,
                                        borderRadius: 4,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () =>
                                      {pageController.setPageIndex(3)},
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                  ),
                                  child: Container(
                                    width: FontSize.blockSizeHorizontal! * 13,
                                    height: FontSize.blockSizeHorizontal! * 13,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(radius * 10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/Avatar.png'),
                                            fit: BoxFit.cover)),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Positioned(
                                            bottom: 1,
                                            right: 1,
                                            child: Container(
                                              width: FontSize
                                                      .blockSizeHorizontal! *
                                                  3.2,
                                              height: FontSize
                                                      .blockSizeHorizontal! *
                                                  3.2,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        radius * 10),
                                                  ),
                                                  border: Border.all(
                                                      color: darkSecond,
                                                      width: 2.0),
                                                  color: Color.fromARGB(
                                                      255, 5, 245, 13)),
                                            ))
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      )),
                  Container(
                    height: 1,
                    decoration: BoxDecoration(color: grey500),
                  ),
                  Gap(spacing * 2),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacing * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Discover the best apartments in your city",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: white,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3.5,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  )),
                          Gap(spacing * 1.2),
                          RoundedSearch(
                            placeholder: "Search apartments",
                          ),
                        ],
                      )),
                  Gap(spacing * 4),
                  Padding(
                      padding: EdgeInsets.all(spacing * 0),
                      child: Wrap(
                        children: [
                          ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                    color: Colors.transparent,
                                    height: spacing * 3,
                                  ),
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _testAja.items.length,
                              itemBuilder: (context, index) {
                                final apartment = _testAja.items[index];

                                return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0),
                                    onPressed: () => Get.to(() => DetailPage(
                                          name: apartment.name,
                                          address: apartment.address,
                                          price: apartment.price,
                                          image: apartment.image1URL,
                                          image2: apartment.image2URL,
                                          image3: apartment.image3URL,
                                          liked: apartment.inFavourite,
                                        )),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: darkSecond),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16)),
                                            child: Image.asset(
                                              apartment.image1URL,
                                              width: double.infinity,
                                              height:
                                                  FontSize.blockSizeVertical! *
                                                      25,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.all(spacing * 2),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: FontSize
                                                              .blockSizeHorizontal! *
                                                          50,
                                                      child: Text(
                                                          apartment.name,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    color:
                                                                        white,
                                                                    fontSize:
                                                                        FontSize.blockSizeHorizontal! *
                                                                            4.2,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    letterSpacing:
                                                                        0.5,
                                                                  )),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                            "IDR ${apartment.price.toStringAsFixed(2)}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                  color:
                                                                      primary500,
                                                                  fontSize:
                                                                      FontSize.blockSizeHorizontal! *
                                                                          3.5,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      0.5,
                                                                )),
                                                        Text("per month",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge!
                                                                .copyWith(
                                                                  color: white,
                                                                  fontSize:
                                                                      FontSize.blockSizeHorizontal! *
                                                                          3.5,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  letterSpacing:
                                                                      0.5,
                                                                )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Gap(spacing * 1.5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/icons/location.svg',
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                                  grey500,
                                                                  BlendMode
                                                                      .srcIn),
                                                          width: FontSize
                                                                  .blockSizeHorizontal! *
                                                              3.5,
                                                        ),
                                                        Gap(spacing),
                                                        SizedBox(
                                                          width: FontSize
                                                                  .blockSizeHorizontal! *
                                                              50,
                                                          child: Text(
                                                              apartment.address,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    color:
                                                                        grey500,
                                                                    fontSize:
                                                                        FontSize.blockSizeHorizontal! *
                                                                            3.5,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    letterSpacing:
                                                                        0.5,
                                                                  )),
                                                        )
                                                      ],
                                                    ),
                                                    Obx(() => IconButton(
                                                          iconSize: FontSize
                                                                  .blockSizeHorizontal! *
                                                              7,
                                                          constraints: BoxConstraints(
                                                              maxWidth: FontSize
                                                                      .blockSizeHorizontal! *
                                                                  10,
                                                              maxHeight: FontSize
                                                                      .blockSizeHorizontal! *
                                                                  10),
                                                          onPressed: () {
                                                            if (apartment
                                                                    .inFavourite
                                                                    .value ==
                                                                false) {
                                                              _testAja.addItem(
                                                                  apartment.id);

                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(radius))),
                                                                backgroundColor:
                                                                    primary500,
                                                                elevation: 8,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1500),
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                content: Text(
                                                                    "Added to favourite successfully!",
                                                                    maxLines: 1,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyLarge!
                                                                        .copyWith(
                                                                          color:
                                                                              white,
                                                                          fontSize:
                                                                              FontSize.blockSizeHorizontal! * 3.5,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          letterSpacing:
                                                                              0.5,
                                                                        )),
                                                              ));
                                                            } else {
                                                              _testAja
                                                                  .removeItem(
                                                                      apartment
                                                                          .id);
                                                            }
                                                          },
                                                          icon: Icon(
                                                              apartment.inFavourite
                                                                          .value ==
                                                                      false
                                                                  ? Icons
                                                                      .favorite_outline
                                                                  : Icons
                                                                      .favorite,
                                                              color:
                                                                  primary500),
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                              })
                        ],
                      )),
                  SizedBox(
                    height: spacing * 12,
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: _onWillPop);
  }
}
