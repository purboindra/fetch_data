import 'package:adr/core/failure.dart';
import 'package:adr/data/model/product_model.dart';
import 'package:adr/riverpod/product_by_id_screen.dart';
import 'package:adr/riverpod/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreenRiverpod extends ConsumerWidget {
  const ProductScreenRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Provider Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Products"),
            switch (product) {
              AsyncValue<List<ProductModel>>(:final valueOrNull?) => Expanded(
                  child: ListView.builder(
                    itemCount: valueOrNull.length,
                    itemBuilder: (context, index) {
                      final product = valueOrNull[index];
                      return ListTile(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductByIdRiverpod(productId: product.id),
                        )),
                        title: Text(product.title),
                      );
                    },
                  ),
                ),
              AsyncValue(:final error?) => Text((error as CustomError).message),
              _ => const Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                )),
            },
          ],
        ),
      ),
    );
  }
}
