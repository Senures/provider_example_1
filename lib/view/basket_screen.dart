import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_example/provider/home_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, HomeProvider hp, widget) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: hp.basketList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100.w,
                      height: 20.h,
                      color: Colors.red,
                      margin: EdgeInsets.all(5.w),
                      child: Row(
                        children: [
                          Image.asset(hp.basketList[index]["product_img"]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                hp.basketList[index]["product_title"],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              Container(
                                  width: 50.w,
                                  height: 8.h,
                                  // color: Colors.white,
                                  child: Text(hp.basketList[index]
                                      ["product_description"])),
                              Text(
                                "\$" + hp.basketList[index]["product_price"],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  hp.arttirma(index);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 7.w,
                                  height: 7.w,
                                  color: Colors.white,
                                  child: Icon(Icons.add),
                                ),
                              ),
                              Text(hp.products[index]["adet"].toString()),
                              Container(
                                width: 7.w,
                                height: 7.w,
                                color: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                  bottom: 20.0,
                  child: Container(
                    width: 100.w,
                    height: 15.h,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      children: [
                        Text(
                          hp.price.toString(),
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
