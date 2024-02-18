import 'package:adr/data/model/product_model.dart';

abstract class ProductDatasource {
  Future<List<ProductModel>> fetchAllProducts();
}
