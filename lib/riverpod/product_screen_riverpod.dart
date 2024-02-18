import 'package:adr/core/failure.dart';
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
        child: product.when(
          data: (data) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final product = data[index];
                      return ListTile(
                        title: Text(product.title),
                      );
                    },
                  ),
                ),
              ],
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
        ),
      ),
    );
  }
}
