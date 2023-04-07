import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';
import 'package:flutter_ui_realestate/pages/auth/login_page1.dart';
import 'package:flutter_ui_realestate/pages/main/detail_page.dart';
import 'package:gap/gap.dart';
import 'package:flutter_ui_realestate/states/apartments.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  final Apartments _testAja = Get.put(Apartments());
  AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with TickerProviderStateMixin {
  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    FontSize().init(context);
    return WillPopScope(
        child: Scaffold(
          backgroundColor: dark500,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: FontSize.blockSizeVertical! * 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/profile-background.png"),
                          fit: BoxFit.cover)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          left: 15,
                          bottom: -35,
                          child: Container(
                            width: FontSize.blockSizeHorizontal! * 20,
                            height: FontSize.blockSizeHorizontal! * 20,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3.0, color: darkSecond),
                                borderRadius:
                                    BorderRadius.circular(radius * 10),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/Avatar.png'),
                                    fit: BoxFit.cover)),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                    bottom: 2,
                                    right: 2,
                                    child: Container(
                                      width:
                                          FontSize.blockSizeHorizontal! * 3.5,
                                      height:
                                          FontSize.blockSizeHorizontal! * 3.5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(radius * 10),
                                          ),
                                          border: Border.all(
                                              color: darkSecond, width: 2.0),
                                          color:
                                              Color.fromARGB(255, 5, 245, 13)),
                                    ))
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: spacing * 4,
                ),
                Padding(
                  padding: EdgeInsets.all(spacing * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Franz Anderson",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: white,
                                fontSize: FontSize.blockSizeHorizontal! * 6.5,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              )),
                      Gap(spacing / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            colorFilter:
                                ColorFilter.mode(grey500, BlendMode.srcIn),
                            width: FontSize.blockSizeHorizontal! * 3.5,
                          ),
                          Gap(spacing / 2),
                          SizedBox(
                            width: FontSize.blockSizeHorizontal! * 50,
                            child: Text("Jakarta, Indonesia",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: grey500,
                                      fontSize:
                                          FontSize.blockSizeHorizontal! * 3.5,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    )),
                          )
                        ],
                      ),
                      Gap(spacing * 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: FontSize.blockSizeHorizontal! * 10,
                            height: 1,
                            decoration: BoxDecoration(color: grey500),
                          )
                        ],
                      ),
                      Gap(spacing * 2),
                      Row(
                        children: [
                          SizedBox(
                            width: FontSize.blockSizeHorizontal! * 80,
                            child: Text(
                                "Hi! I am Franz, I really like traveling to really different countries, most often I am looking for flats that have very friendly landlords in a good location.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: grey500,
                                      fontSize:
                                          FontSize.blockSizeHorizontal! * 3.5,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    )),
                          )
                        ],
                      ),
                      Gap(spacing * 2),
                      Container(
                        child: TabBar(
                            controller: tabController,
                            // isScrollable: true,
                            // labelPadding: EdgeInsets.only(left: 20, right: 20),
                            labelStyle: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold),
                            labelColor: white,
                            unselectedLabelColor: grey500,
                            unselectedLabelStyle: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500),
                            indicator: UnderlineTabIndicator(
                                borderSide:
                                    BorderSide(width: 1.5, color: primary500),
                                borderRadius: BorderRadius.circular(radius)),
                            tabs: [
                              Tab(
                                text: "Rent History",
                              ),
                              Tab(
                                text: "Settings",
                              ),
                            ]),
                      ),
                      Gap(spacing),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                      maxHeight: FontSize.blockSizeVertical! * 65),
                  child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      controller: tabController,
                      children: [
                        ListView.separated(
                            separatorBuilder: (context, index) => const Divider(
                                  color: Colors.transparent,
                                  height: spacing * 3,
                                ),
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: false,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              final apartment =
                                  widget._testAja.items[index + 1];

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
                                                            widget._testAja
                                                                .addItem(
                                                                    apartment
                                                                        .id);

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              radius))),
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
                                                                            FontSize.blockSizeHorizontal! *
                                                                                3.5,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        letterSpacing:
                                                                            0.5,
                                                                      )),
                                                            ));
                                                          } else {
                                                            widget._testAja
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
                                                            color: primary500),
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            }),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: spacing * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return primary300;
                                      }
                                      return darkSecond;
                                    },
                                  ),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: spacing * 2,
                                        horizontal: spacing * 2),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(radius * 10),
                                      side: BorderSide(
                                        color: darkSecond,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: grey500.withAlpha(70),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        radius * 10)),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    spacing * 1.5),
                                                child: SvgPicture.asset(
                                                  'assets/icons/account.svg',
                                                  colorFilter: ColorFilter.mode(
                                                      white, BlendMode.srcIn),
                                                  width: FontSize
                                                          .blockSizeHorizontal! *
                                                      5,
                                                ),
                                              ),
                                            )),
                                        Gap(spacing * 1.5),
                                        Text("Account",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: white,
                                                  fontSize: FontSize
                                                          .blockSizeHorizontal! *
                                                      3.5,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                )),
                                      ],
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: primary500,
                                            borderRadius: BorderRadius.circular(
                                                radius * 10)),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(spacing * 1.5),
                                            child: SvgPicture.asset(
                                              'assets/icons/arrow-right.svg',
                                              colorFilter: ColorFilter.mode(
                                                  white, BlendMode.srcIn),
                                              width: FontSize
                                                      .blockSizeHorizontal! *
                                                  5,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Gap(spacing * 2),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return primary300;
                                      }
                                      return darkSecond;
                                    },
                                  ),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: spacing * 2,
                                        horizontal: spacing * 2),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(radius * 10),
                                      side: BorderSide(
                                        color: darkSecond,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: grey500.withAlpha(70),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        radius * 10)),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    spacing * 1.5),
                                                child: SvgPicture.asset(
                                                  'assets/icons/card.svg',
                                                  colorFilter: ColorFilter.mode(
                                                      white, BlendMode.srcIn),
                                                  width: FontSize
                                                          .blockSizeHorizontal! *
                                                      5,
                                                ),
                                              ),
                                            )),
                                        Gap(spacing * 1.5),
                                        Text("Payment Settings",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: white,
                                                  fontSize: FontSize
                                                          .blockSizeHorizontal! *
                                                      3.5,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                )),
                                      ],
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: primary500,
                                            borderRadius: BorderRadius.circular(
                                                radius * 10)),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(spacing * 1.5),
                                            child: SvgPicture.asset(
                                              'assets/icons/arrow-right.svg',
                                              colorFilter: ColorFilter.mode(
                                                  white, BlendMode.srcIn),
                                              width: FontSize
                                                      .blockSizeHorizontal! *
                                                  5,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Gap(spacing * 2),
                              ElevatedButton(
                                onPressed: () => Get.to(() => LoginPage1()),
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return primary300;
                                      }
                                      return darkSecond;
                                    },
                                  ),
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: spacing * 2,
                                        horizontal: spacing * 2),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(radius * 10),
                                      side: BorderSide(
                                        color: darkSecond,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                color: red500.withAlpha(70),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        radius * 10)),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    spacing * 1.5),
                                                child: SvgPicture.asset(
                                                  'assets/icons/logout.svg',
                                                  colorFilter: ColorFilter.mode(
                                                      white, BlendMode.srcIn),
                                                  width: FontSize
                                                          .blockSizeHorizontal! *
                                                      5,
                                                ),
                                              ),
                                            )),
                                        Gap(spacing * 1.5),
                                        Text("Logout",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  color: white,
                                                  fontSize: FontSize
                                                          .blockSizeHorizontal! *
                                                      3.5,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                )),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
                Gap(spacing * 12)
              ],
            ),
          )),
        ),
        onWillPop: _onWillPop);
  }
}
