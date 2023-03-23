import 'package:get/get.dart';

class Item {
  int id;
  String name;
  double price;
  String address;
  String image1URL;
  String image2URL;
  String image3URL;
  RxBool inFavourite;

  Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.address,
      required this.image1URL,
      required this.image2URL,
      required this.image3URL,
      required this.inFavourite});
}
