import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  List products = [
    {
      "product_title": "Pothos",
      "product_img": "assets/img1.png",
      "product_description":
          "Lorem ipsum,is simply dummy text of the printing and typesetting industry.",
      "product_price": "12",
      "isFav": false,
      "adet": 1
    },
    {
      "product_title": "Pothos",
      "product_img": "assets/img2.png",
      "product_description":
          "Lorem ipsum,is simply dummy text of the printing and typesetting industry.",
      "product_price": "53",
      "isFav": false,
      "adet": 1
    },
    {
      "product_title": "Pothos",
      "product_img": "assets/img3.png",
      "product_description":
          "Lorem ipsum,is simply dummy text of the printing and typesetting industry.",
      "product_price": "19",
      "isFav": false,
      "adet": 1
    },
    {
      "product_title": "Pothos",
      "product_img": "assets/img1.png",
      "product_description":
          "Lorem ipsum,is simply dummy text of the printing and typesetting industry.",
      "product_price": "43",
      "isFav": false,
      "adet": 1
    },
    {
      "product_title": "Pothos",
      "product_img": "assets/img2.png",
      "product_description":
          "Lorem ipsum,is simply dummy text of the printing and typesetting industry.",
      "product_price": "22",
      "isFav": false,
      "adet": 1
    },
    {
      "product_title": "Pothos",
      "product_img": "assets/img3.png",
      "product_description":
          "Lorem ipsum,is simply dummy text of the printing and typesetting industry.",
      "product_price": "10",
      "isFav": false,
      "adet": 1
    }
  ];

  changeColor(int index) {
    print(products[index]["isFav"]);
    products[index]["isFav"] = !products[index]["isFav"];

    // != böyle yapmışsın bu eşit değil demek

    print(products[index]["isFav"]);
    notifyListeners();
  }

  List basketList = [];
  int adet = 1;
  addBasketList(int index) {
    basketList.add(products[index]);
    notifyListeners();
  }

  int get price => priceProduct();
  //getter fonksiyonu
  priceProduct() {
    int price = 0;
    for (var i = 0; i < basketList.length; i++) {
      price += int.parse(basketList[i]["product_price"]) *
          int.parse(products[i]["adet"].toString());
    }

    print(price);
    return price;
  }

  addProduct(int index) {
//eğer bu ürün varsa adet sayısını artır yoksa listeye ekle
    if (basketList.contains(products[index])) {
      products[index]["adet"]++;
      priceProduct();
    } else {
      basketList.add(products[index]);
    }
  }


  arttirma(int index){
  basketList[index]["adet"]++;
  notifyListeners();
  }
}
