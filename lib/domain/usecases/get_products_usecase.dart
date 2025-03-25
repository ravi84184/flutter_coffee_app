import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> execute(String category) async {
    return await repository.getProductsByCategory(category);
  }
}

class GetPopularProductsUseCase {
  final ProductRepository repository;

  GetPopularProductsUseCase(this.repository);

  Future<List<Product>> execute() async {
    return await repository.getPopularProducts();
  }
}

class SearchProductsUseCase {
  final ProductRepository repository;

  SearchProductsUseCase(this.repository);

  Future<List<Product>> execute(String query) async {
    return await repository.searchProducts(query);
  }
}
