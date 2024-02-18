import 'package:adr/data/datasource/providers/datasource_provider.dart';
import 'package:adr/data/repository/product_repository.dart';
import 'package:adr/data/repository/product_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(
      productDatasource: ref.read(productDatasourceProvider));
}
