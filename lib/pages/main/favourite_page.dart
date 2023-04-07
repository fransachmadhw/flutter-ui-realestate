import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';
import 'package:flutter_ui_realestate/pages/main/detail_page.dart';
import 'package:flutter_ui_realestate/states/apartments.dart';
import 'package:flutter_ui_realestate/widgets/input/rounded_search.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final Apartments _testAja = Get.find<Apartments>();

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
                  Gap(spacing),
                  Padding(
                    padding: EdgeInsets.all(spacing * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Favourite Apartments",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: white,
                                  fontSize: FontSize.blockSizeHorizontal! * 6,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                )),
                        Gap(spacing * 1.2),
                        RoundedSearch(
                          placeholder: "Search apartments",
                        ),
                      ],
                    ),
                  ),
                  if (_testAja.favouriteItems.isNotEmpty)
                    Column(
                      children: [
                        Obx(() => ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => const Divider(
                                  color: Colors.transparent,
                                  height: spacing * 3,
                                ),
                            itemBuilder: (context, index) {
                              final apartment = _testAja.favouriteItems[index];

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
                                        borderRadius: BorderRadius.circular(16),
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
                                          padding: EdgeInsets.all(spacing * 2),
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
                                                    child: Text(apartment.name,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                              color: white,
                                                              fontSize: FontSize
                                                                      .blockSizeHorizontal! *
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
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                          "IDR ${apartment.price.toStringAsFixed(2)}",
                                                          style:
                                                              Theme.of(context)
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
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    color:
                                                                        white,
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
                                                        MainAxisAlignment.start,
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
                                                  IconButton(
                                                    color: primary500,
                                                    iconSize: FontSize
                                                            .blockSizeHorizontal! *
                                                        6,
                                                    icon: const Icon(
                                                        Icons.delete),
                                                    onPressed: () {
                                                      apartment.inFavourite
                                                          .value = false;
                                                      _testAja.removeItem(
                                                          apartment.id);
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                            itemCount: _testAja.favouriteItems.length)),
                        SizedBox(
                          height: spacing * 12,
                        )
                      ],
                    )
                  else
                    Container(
                      width: double.infinity,
                      height: FontSize.blockSizeVertical! * 70,
                      child: Center(
                        child: Text("Looks empty here",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: grey500,
                                  fontSize: FontSize.blockSizeHorizontal! * 5,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                )),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
        onWillPop: _onWillPop);
  }
}
