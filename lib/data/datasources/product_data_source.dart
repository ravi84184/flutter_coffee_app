import '../models/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getProductsByCategory(String category);
  Future<ProductModel> getProductById(String id);
  Future<List<ProductModel>> searchProducts(String query);
  Future<List<ProductModel>> getPopularProducts();
}

class RemoteProductDataSource implements ProductDataSource {
  final String baseUrl;

  RemoteProductDataSource({required this.baseUrl});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    // Implement API call
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    // Implement API call
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    // Implement API call
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getPopularProducts() async {
    // Implement API call
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    // Implement API call
    throw UnimplementedError();
  }
}
