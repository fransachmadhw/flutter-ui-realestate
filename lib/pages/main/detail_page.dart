import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_realestate/global/color_palettes.dart';
import 'package:flutter_ui_realestate/global/font_size.dart';
import 'package:flutter_ui_realestate/global/sizing.dart';
import 'package:flutter_ui_realestate/pages/main/view_photo.dart';
import 'package:flutter_ui_realestate/widgets/button/primary_button.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String address;
  final double price;
  final String image;
  final String image2;
  final String image3;
  final RxBool liked;
  const DetailPage(
      {super.key,
      required this.name,
      required this.address,
      required this.price,
      required this.image,
      required this.image2,
      required this.image3,
      required this.liked});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    FontSize().init(context);

    final List<String> imgList = [widget.image, widget.image2, widget.image3];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          toolbarHeight: 0,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: dark500,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          )),
      backgroundColor: dark500,
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
              width: double.infinity,
              height: FontSize.blockSizeVertical! * 40,
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.expand,
                children: [
                  CarouselSlider(
                    items: imgList
                        .map((item) => InkWell(
                            onTap: () => Get.to(() => ViewPhoto(url: item)),
                            child: Container(
                              child: Center(
                                  child:
                                      Image.asset(item, fit: BoxFit.contain)),
                            )))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: false,
                        viewportFraction: 1.5,
                        aspectRatio: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Positioned(
                      bottom: 10.0,
                      left: 0.0,
                      right: 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: spacing),
                              decoration: BoxDecoration(
                                  color: dark500.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      imgList.asMap().entries.map((entry) {
                                    return GestureDetector(
                                        // onTap: () => _controller.animateToPage(entry.key),
                                        child: Container(
                                      width: FontSize.blockSizeHorizontal! * 2,
                                      height: FontSize.blockSizeHorizontal! * 2,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _current == entry.key
                                            ? primary500
                                            : lightGrey500,
                                      ),
                                    ));
                                  }).toList()),
                            ),
                          )
                        ],
                      ))
                ],
              )),
          Padding(
            padding: EdgeInsets.all(spacing * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      ignoreGestures: true,
                      itemSize: FontSize.blockSizeHorizontal! * 5,
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.only(right: 4),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Obx(() => InkWell(
                          child: Icon(
                            widget.liked.value == false
                                ? Icons.favorite_outline
                                : Icons.favorite,
                            color: primary500,
                            size: FontSize.blockSizeHorizontal! * 9,
                          ),
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            if (widget.liked.value == false) {
                              widget.liked.value = true;

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(radius))),
                                backgroundColor: primary500,
                                elevation: 8,
                                duration: Duration(milliseconds: 1500),
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                    "Added to favourite successfully!",
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: white,
                                          fontSize:
                                              FontSize.blockSizeHorizontal! *
                                                  3.5,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        )),
                              ));
                            } else {
                              widget.liked.value = false;
                            }
                          },
                        )),
                  ],
                ),
                Gap(spacing * 2),
                Row(
                  children: [
                    SizedBox(
                      width: FontSize.blockSizeHorizontal! * 80,
                      child: Text(
                        widget.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                fontSize: FontSize.blockSizeHorizontal! * 6),
                      ),
                    ),
                  ],
                ),
                Gap(spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/location.svg',
                      colorFilter: ColorFilter.mode(grey500, BlendMode.srcIn),
                      width: FontSize.blockSizeHorizontal! * 3.5,
                    ),
                    Gap(spacing),
                    SizedBox(
                      width: FontSize.blockSizeHorizontal! * 85,
                      child: Text(widget.address,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: grey500,
                                fontSize: FontSize.blockSizeHorizontal! * 3.5,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              )),
                    )
                  ],
                ),
                Gap(spacing * 3),
                Text(
                  "Specification",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      fontSize: FontSize.blockSizeHorizontal! * 4.5),
                ),
                Gap(spacing),
                Wrap(
                    direction: Axis.horizontal,
                    spacing: spacing,
                    alignment: WrapAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(spacing),
                            decoration: BoxDecoration(
                                color: darkSecond,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "3 Bathrooms",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: white,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.5,
                                        fontSize:
                                            FontSize.blockSizeHorizontal! * 3),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(spacing),
                            decoration: BoxDecoration(
                                color: darkSecond,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "4 Bedrooms",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: white,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.5,
                                        fontSize:
                                            FontSize.blockSizeHorizontal! * 3),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(spacing),
                            decoration: BoxDecoration(
                                color: darkSecond,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "Wi-Fi",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: white,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.5,
                                        fontSize:
                                            FontSize.blockSizeHorizontal! * 3),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(spacing),
                            decoration: BoxDecoration(
                                color: darkSecond,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "1.250 square feet",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: white,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.5,
                                        fontSize:
                                            FontSize.blockSizeHorizontal! * 3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                Gap(spacing * 3),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      fontSize: FontSize.blockSizeHorizontal! * 4.5),
                ),
                Gap(spacing),
                Text(
                  "Nullam hendrerit lectus non pretium fermentum. Donec faucibus sodales ante, nec finibus quam lacinia sit amet. Nunc ut posuere erat. Proin convallis odio elementum sem vestibulum",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: grey500,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      fontSize: FontSize.blockSizeHorizontal! * 3.5),
                ),
                Gap(spacing * 3),
                Text(
                  "Overview",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      fontSize: FontSize.blockSizeHorizontal! * 4.5),
                ),
                Gap(spacing),
                Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: grey500,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3.5),
                          ),
                          Text(
                            "For Rent",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3.5),
                          ),
                        ]),
                    Gap(spacing),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Living Area",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: grey500,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3.5),
                          ),
                          Text(
                            "1.250 square feet",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3.5),
                          ),
                        ]),
                    Gap(spacing),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: grey500,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3.5),
                          ),
                          Text(
                            "Modern",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3.5),
                          ),
                        ]),
                    Gap(spacing),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Year Built",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: grey500,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3.5),
                          ),
                          Text(
                            "2017",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    fontSize:
                                        FontSize.blockSizeHorizontal! * 3.5),
                          ),
                        ])
                  ],
                ),
                Gap(spacing * 3)
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: Container(
          height: FontSize.blockSizeVertical! * 11,
          padding: EdgeInsets.all(spacing * 2),
          decoration: BoxDecoration(color: dark500),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("IDR ${widget.price.toStringAsFixed(2)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: primary500,
                                  fontSize: FontSize.blockSizeHorizontal! * 5,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                )),
                        Text("per month",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: white,
                                  fontSize: FontSize.blockSizeHorizontal! * 3.5,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                )),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return primary300;
                            }
                            return primary500;
                          },
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: spacing * 1.5, horizontal: spacing * 4),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius * 10),
                            side: BorderSide(
                              color: darkSecond,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      child: Text("Booking",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: white,
                                    fontSize: FontSize.blockSizeHorizontal! * 4,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  )),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
