import 'package:adr/data/datasource/product_datasource.dart';
import 'package:adr/data/datasource/product_datasource_impl.dart';
import 'package:adr/data/model/product_model.dart';
import 'package:adr/data/repository/product_repository_impl.dart';
import 'package:flutter/material.dart';

import '../data/repository/product_repository.dart';

class ProductByIdScreenStateful extends StatefulWidget {
  final int productId;

  const ProductByIdScreenStateful({super.key, required this.productId});

  @override
  State<ProductByIdScreenStateful> createState() =>
      _ProductByIdScreenStatefulState();
}

class _ProductByIdScreenStatefulState extends State<ProductByIdScreenStateful> {
  ProductModel productModel =
      ProductModel(id: 0, title: "", description: "", thumbnail: "");

  bool _isLoading = false;

  late ProductDatasource productDatasource;
  late ProductRepository productRepository;

  Future<void> fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final result = await productRepository.fetchProductById(widget.productId);
    setState(() {
      _isLoading = false;
    });

    result.fold((l) => null, (r) {
      setState(() {
        productModel = r;
      });
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
        title: const Text("Product By Id Stateful"),
      ),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator.adaptive(),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(productModel.title)],
              ),
            ),
    );
  }
}
