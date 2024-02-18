import 'package:adr/core/failure.dart';
import 'package:adr/riverpod/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductByIdRiverpod extends ConsumerWidget {
  final int productId;

  const ProductByIdRiverpod({required this.productId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productById = ref.watch(fetchProductByIdProvider(productId));
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product By Id"),
        ),
        body: productById.when(
          data: (data) {
            return Center(
              child: Text(data.title),
            );
          },
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text((error as CustomError).message)],
            ),
          ),
          loading: () => const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator.adaptive(),
              ],
            ),
          ),
        ));
  }
}
