import 'package:adr/core/failure.dart';
import 'package:adr/core/typedefs/typedef.dart';
import 'package:adr/data/datasource/product_datasource.dart';
import 'package:adr/data/model/product_model.dart';
import 'package:adr/data/repository/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource productDatasource;

  const ProductRepositoryImpl({required this.productDatasource});

  @override
  FutureEither<List<ProductModel>> fetchAllProducts() async {
    try {
      final response = await productDatasource.fetchAllProducts();
      return Right(response);
    } catch (e, st) {
      return Left(Failure(e.toString(), st));
    }
  }
}
