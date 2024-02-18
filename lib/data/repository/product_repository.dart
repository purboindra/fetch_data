import 'package:adr/core/typedefs/typedef.dart';
import 'package:adr/data/model/product_model.dart';

abstract class ProductRepository {
  FutureEither<List<ProductModel>> fetchAllProducts();
}
