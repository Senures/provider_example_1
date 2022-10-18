import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_example/provider/home_provider.dart';
import 'package:provider_app_example/view/basket_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, HomeProvider hp, widget) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: const Icon(
              Icons.menu_rounded,
              color: Colors.black45,
              size: 35.0,
            ),
            actions: [
              Container(
                padding: EdgeInsets.all(1.w),
                margin: EdgeInsets.only(right: 5.w, bottom: 2.h),
                width: 5.h,
                height: 3.h,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5.0)),
                // child: Image.asset("assets/user.png"),
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                width: 100.w,
                height: 7.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black12),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Container(
                  height: 40.h,
                  // color: Colors.red,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hp.products.length,
                    itemBuilder: (context, index) {
                      var item = hp.products[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        width: 55.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            border:
                                Border.all(color: Colors.black12, width: 2.0),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          width: 20.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20.0)),
                          margin: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 1.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Image.asset(
                                    item["product_img"],
                                  ),
                                  Positioned(
                                      top: 10.0,
                                      left: 10.0,
                                      child: IconButton(
                                          onPressed: () {
                                            hp.changeColor(index);
                                          },
                                          icon: Icon(
                                            item["isFav"] == false
                                                ? Icons.favorite_border
                                                : Icons.favorite,
                                            color: item["isFav"] == true
                                                ? Colors.red
                                                : Colors.black54,
                                          )))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item["product_title"],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    "\$" + item["product_price"],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      hp.addProduct(index);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 5.w, bottom: 1.h),
                                      width: 10.w,
                                      height: 10.w,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 245, 105, 81),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: Colors.black12,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const BasketPage(),
                ),
              );
            },
            child: const Icon(
              Icons.shopping_cart,
              size: 35.0,
              color: Color.fromARGB(255, 245, 105, 81),
            ),
          ),
        );
      },
    );
  }
}
