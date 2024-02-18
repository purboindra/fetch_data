import 'package:adr/data/datasource/product_datasource.dart';
import 'package:adr/data/datasource/product_datasource_impl.dart';
import 'package:adr/data/repository/product_repository.dart';
import 'package:adr/data/repository/product_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../data/model/product_model.dart';

class ProductStatefulScreen extends StatefulWidget {
  const ProductStatefulScreen({super.key});

  @override
  State<ProductStatefulScreen> createState() => _ProductStatefulScreenState();
}

class _ProductStatefulScreenState extends State<ProductStatefulScreen> {
  List<ProductModel> products = [];
  bool _isLoading = false;
  final dio = Dio();

  late ProductDatasource productDatasource;
  late ProductRepository productRepository;

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final result = await productRepository.fetchAllProducts();
    setState(() {
      _isLoading = false;
    });

    result.fold((l) => products, (r) {
      for (final product in r) {
        products.add(ProductModel.fromMap(product.toMap()));
      }
    });
  }

  void callFetchData() async {
    await fetchData();
  }

  @override
  void initState() {
    super.initState();
    productDatasource = ProductDatasourceImpl();
    productRepository =
        ProductRepositoryImpl(productDatasource: productDatasource);
    callFetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Stateful Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        ),
        child: Column(
          children: [
            if (_isLoading) ...[
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ] else if (!_isLoading && products.isNotEmpty) ...[
              Expanded(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      products[index].title,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ))
            ] else ...[
              const Center(
                child: Text("Sorry something went wrong!"),
              )
            ],
          ],
        ),
      ),
    );
  }
}
