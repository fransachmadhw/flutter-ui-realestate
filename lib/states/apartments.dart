import 'package:flutter_ui_realestate/models/item.dart';
import 'package:get/get.dart';

class Apartments extends GetxController {
  RxList<Item> temp = <Item>[
    Item(
        id: 1,
        name: 'ROSA by Kozystay 2BR Private Lift',
        price: 12500000,
        address: '16 Jalan Denpasar Raya, 12950 Jakarta, Indonesia',
        image1URL: 'assets/images/apartment1-image1.jpg',
        image2URL: 'assets/images/apartment1-image2.jpg',
        image3URL: 'assets/images/apartment1-image3.jpg',
        inFavourite: false.obs),
    Item(
        id: 2,
        name: 'Studio Room at Way Seputih Residence',
        price: 2450000,
        address:
            'Jl. Way Seputih V No.2, RT.3/RW.1, Tj. Duren Sel., Grogol Petamburan, Jakarta Barat, DKI Jakarta',
        image1URL: 'assets/images/apartment2-image1.jpg',
        image2URL: 'assets/images/apartment2-image2.jpg',
        image3URL: 'assets/images/apartment2-image3.jpg',
        inFavourite: false.obs),
    Item(
        id: 3,
        name: 'Apt Casablanca East 2BR',
        price: 9240000,
        address:
            'No.2 Jalan Pahlawan Revolusi Apartemen Casablanca East, 13420 Jakarta, Indonesia',
        image1URL: 'assets/images/apartment3-image1.jpg',
        image2URL: 'assets/images/apartment3-image2.jpg',
        image3URL: 'assets/images/apartment3-image3.jpg',
        inFavourite: false.obs),
    Item(
        id: 4,
        name: 'Treehouse Suites Boutique Serviced',
        price: 9240000,
        address:
            'Jl. Karbela Timur No.1A, Karet, Setiabudi, 12920 Jakarta, Indonesia',
        image1URL: 'assets/images/apartment4-image1.jpg',
        image2URL: 'assets/images/apartment4-image2.jpg',
        image3URL: 'assets/images/apartment4-image3.jpg',
        inFavourite: false.obs),
    Item(
        id: 5,
        name: 'Modern and Minimalist 2BR Apartment Salemba Residence',
        price: 7450000,
        address:
            'Jl. Salemba Tengah II No.10, RW.8, Paseban, Senen, Jakarta Pusat, DKI Jakarta',
        image1URL: 'assets/images/apartment5-image1.jpg',
        image2URL: 'assets/images/apartment5-image2.jpg',
        image3URL: 'assets/images/apartment5-image3.jpg',
        inFavourite: false.obs),
    Item(
        id: 6,
        name: 'The Royal 2BR St. Moritz Apartment',
        price: 11400000,
        address:
            'Jl. Puri Indah Raya, RT.3/RW.2, Kembangan Sel., Kembangan, Jakarta Barat, DKI Jakarta',
        image1URL: 'assets/images/apartment6-image1.JPG',
        image2URL: 'assets/images/apartment6-image2.JPG',
        image3URL: 'assets/images/apartment6-image3.JPG',
        inFavourite: false.obs),
    Item(
        id: 7,
        name: '1BR Apartment at 18 Residence Taman Rasuna Near Epicentrum',
        price: 5829000,
        address:
            'Jl. Taman Rasuna Tim. No.16, RT.16/RW.1, Menteng Atas, Setiabudi, Jakarta Selatan, DKI Jakarta',
        image1URL: 'assets/images/apartment7-image1.jpg',
        image2URL: 'assets/images/apartment7-image2.jpg',
        image3URL: 'assets/images/apartment7-image3.jpg',
        inFavourite: false.obs),
    Item(
        id: 8,
        name: '1BR Apartment at 18 Residence Taman Rasuna Near Epicentrum',
        price: 10550000,
        address:
            'Jl. Jenderal Sudirman Jl. Pintu Satu Senayan, RT.14/RW.1, Bend. Hilir, Tanah Abang, Jakarta Pusat, DKI Jakarta',
        image1URL: 'assets/images/apartment8-image1.jpg',
        image2URL: 'assets/images/apartment8-image2.jpeg',
        image3URL: 'assets/images/apartment8-image3.jpg',
        inFavourite: false.obs),
  ].obs;

  // Use this to retrieve all products
  List<Item> get items {
    return [...temp];
  }

  // This will return the products that were added to favourite
  List<Item> get favouriteItems {
    return temp.where((item) => item.inFavourite.value == true).toList();
  }

  // Add an item to the favourite
  void addItem(int id) {
    final int index = temp.indexWhere((item) => item.id == id);
    temp[index].inFavourite.value = true;
  }

  // Remove an item from the favourite
  void removeItem(int id) {
    final int index = temp.indexWhere((item) => item.id == id);
    temp[index].inFavourite.value = false;
  }
}
