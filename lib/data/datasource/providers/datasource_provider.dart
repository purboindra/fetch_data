import 'package:adr/data/datasource/product_datasource.dart';
import 'package:adr/data/datasource/product_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
ProductDatasource productDatasource(ProductDatasourceRef ref) {
  return ProductDatasourceImpl();
}
