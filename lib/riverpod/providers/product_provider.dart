import 'package:adr/data/datasource/providers/datasource_provider.dart';
import 'package:adr/data/model/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class Product extends _$Product {
  @override
  FutureOr<List<ProductModel>> build() {
    return fetchProduct();
  }

  Future<List<ProductModel>> fetchProduct() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result =
          await ref.read(productDatasourceProvider).fetchAllProducts();

      return result;
    });
    return state.value ?? [];
  }
}

@riverpod
class FetchProductById extends _$FetchProductById {
  @override
  FutureOr<ProductModel> build(int productId) async {
    return await fetchProductById(productId);
  }

  Future<ProductModel> fetchProductById(int productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response =
          await ref.read(productDatasourceProvider).fetchProductById(productId);
      ref.keepAlive();
      return response;
    });

    return state.value ??
        ProductModel(id: 0, title: "", description: "", thumbnail: "");
  }
}
