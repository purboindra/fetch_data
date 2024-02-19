import 'package:adr/get/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductByIdScreenGetx extends StatelessWidget {
  ProductByIdScreenGetx({super.key});

  final _productC = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen By Id"),
      ),
      body: Obx(() {
        if (_productC.isLoading.isTrue) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator.adaptive(),
              ],
            ),
          );
        }
        if (_productC.isLoading.isFalse) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 18,
            ),
            child: Column(
              children: [
                Text(_productC.product.value.title),
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
