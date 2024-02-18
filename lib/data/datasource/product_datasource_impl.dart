import 'dart:developer';

import 'package:adr/core/failure.dart';
import 'package:adr/data/datasource/product_datasource.dart';
import 'package:adr/data/model/product_model.dart';
import 'package:adr/main.dart';
import 'package:dio/dio.dart';

class ProductDatasourceImpl implements ProductDatasource {
  final dio = Dio();

  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    log("PRODUCT DATASOURCE DALLED");
    try {
      List<ProductModel> tempProducts = [];
      final response = await dio.get(url);
      if (response.statusCode != 200) {
        throw CustomError("Terjadi kesalahan, silahkan coba lagi...");
      }

      for (final product in response.data["products"]) {
        tempProducts.add(ProductModel.fromMap(product));
      }

      return tempProducts;
    } catch (e, st) {
      log("ERROR PRODUCT DATASOURCE $e");
      throw CustomError(e.toString());
    }
  }

  @override
  Future<ProductModel> fetchProductById(int productId) async {
    try {
      final response = await dio.get("$url/$productId");
      if (response.statusCode != 200) {
        throw CustomError("Terjadi kesalahan, silahkan coba lagi...");
      }

      return ProductModel.fromMap(response.data);
    } catch (e, st) {
      log("ERROR PRODUCT DATASOURCE PRODUCT BY ID $e");
      throw CustomError(e.toString());
    }
  }
}
