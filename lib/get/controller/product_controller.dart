import 'package:adr/data/datasource/product_datasource.dart';
import 'package:adr/data/datasource/product_datasource_impl.dart';
import 'package:adr/data/model/product_model.dart';
import 'package:adr/data/repository/product_repository.dart';
import 'package:adr/data/repository/product_repository_impl.dart';
import 'package:get/get.dart';

class ProductControlelr extends GetxController {
  late ProductDatasource productDatasource;
  late ProductRepository productRepository;

  @override
  void onInit() async {
    super.onInit();
    productDatasource = ProductDatasourceImpl();
    productRepository =
        ProductRepositoryImpl(productDatasource: productDatasource);
    await fetchAllProduct();
  }

  final RxList<ProductModel> _productList = <ProductModel>[].obs;
  RxList<ProductModel> get productList => _productList;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  Future<void> fetchAllProduct() async {
    _isLoading.value = true;
    final result = await productRepository.fetchAllProducts();
    _isLoading.value = false;
    result.fold((l) => [], (r) {
      for (final product in r) {
        _productList.add(ProductModel.fromMap(product.toMap()));
      }
    });
  }
}
