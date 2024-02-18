// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productHash() => r'e4994ae952e2955dfae0254c5af3eb5ae327bf28';

/// See also [Product].
@ProviderFor(Product)
final productProvider =
    AutoDisposeAsyncNotifierProvider<Product, List<ProductModel>>.internal(
  Product.new,
  name: r'productProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Product = AutoDisposeAsyncNotifier<List<ProductModel>>;
String _$fetchProductByIdHash() => r'fec8c541989ef5e09c1384e7b9c24f5d4ed6c953';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FetchProductById
    extends BuildlessAutoDisposeAsyncNotifier<ProductModel> {
  late final int productId;

  FutureOr<ProductModel> build(
    int productId,
  );
}

/// See also [FetchProductById].
@ProviderFor(FetchProductById)
const fetchProductByIdProvider = FetchProductByIdFamily();

/// See also [FetchProductById].
class FetchProductByIdFamily extends Family<AsyncValue<ProductModel>> {
  /// See also [FetchProductById].
  const FetchProductByIdFamily();

  /// See also [FetchProductById].
  FetchProductByIdProvider call(
    int productId,
  ) {
    return FetchProductByIdProvider(
      productId,
    );
  }

  @override
  FetchProductByIdProvider getProviderOverride(
    covariant FetchProductByIdProvider provider,
  ) {
    return call(
      provider.productId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchProductByIdProvider';
}

/// See also [FetchProductById].
class FetchProductByIdProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FetchProductById, ProductModel> {
  /// See also [FetchProductById].
  FetchProductByIdProvider(
    int productId,
  ) : this._internal(
          () => FetchProductById()..productId = productId,
          from: fetchProductByIdProvider,
          name: r'fetchProductByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchProductByIdHash,
          dependencies: FetchProductByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchProductByIdFamily._allTransitiveDependencies,
          productId: productId,
        );

  FetchProductByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final int productId;

  @override
  FutureOr<ProductModel> runNotifierBuild(
    covariant FetchProductById notifier,
  ) {
    return notifier.build(
      productId,
    );
  }

  @override
  Override overrideWith(FetchProductById Function() create) {
    return ProviderOverride(
      origin: this,
      override: FetchProductByIdProvider._internal(
        () => create()..productId = productId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FetchProductById, ProductModel>
      createElement() {
    return _FetchProductByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchProductByIdProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchProductByIdRef on AutoDisposeAsyncNotifierProviderRef<ProductModel> {
  /// The parameter `productId` of this provider.
  int get productId;
}

class _FetchProductByIdProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FetchProductById,
        ProductModel> with FetchProductByIdRef {
  _FetchProductByIdProviderElement(super.provider);

  @override
  int get productId => (origin as FetchProductByIdProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
