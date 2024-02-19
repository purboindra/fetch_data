import 'package:adr/get/controller/product_controller.dart';
import 'package:adr/get/product_by_id_screen_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreenGetx extends StatelessWidget {
  ProductScreenGetx({super.key});

  final productC = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen Getx"),
      ),
      body: Obx(() {
        if (productC.isLoading.isTrue) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator.adaptive(),
              ],
            ),
          );
        }
        if (productC.isLoading.isFalse) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 18,
            ),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: productC.productList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        // await Future.delayed(Duration.zero, () async {
                        //   await Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => ProductByIdScreenGetx(),
                        //       ));
                        // });
                        Get.to(() => ProductByIdScreenGetx(), arguments: {
                          "productId": productC.productList[index].id,
                        });
                        // await productC
                        //     .fetchProductById(productC.productList[index].id);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          productC.productList[index].title,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ],
            ),
          );
        }
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sorry, something went wrong!"),
            ],
          ),
        );
      }),
    );
  }
}
