import 'package:adr/data/datasource/product_datasource.dart';
import 'package:adr/data/datasource/product_datasource_impl.dart';
import 'package:adr/data/model/product_model.dart';
import 'package:adr/data/repository/product_repository.dart';
import 'package:adr/data/repository/product_repository_impl.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  late ProductDatasource productDatasource;
  late ProductRepository productRepository;

  int productId = 0;

  @override
  void onInit() async {
    super.onInit();
    productDatasource = ProductDatasourceImpl();
    productRepository = ProductRepositoryImpl(productDatasource: productDatasource);
    final arguments = Get.arguments as Map<String, dynamic>;
    if (arguments.containsKey("productId")) {
      productId = arguments["productId"];
    }
    await fetchProductById(productId);
  }

  final Rx<ProductModel> _product = ProductModel(id: 0, title: "", description: "", thumbnail: "").obs;
  Rx<ProductModel> get product => _product;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  Future<void> fetchProductById(int productId) async {
    _isLoading.value = true;
    final result = await productRepository.fetchProductById(productId);
    _isLoading.value = false;
    result.fold((l) => null, (r) => _product.value = r);
  }
}
