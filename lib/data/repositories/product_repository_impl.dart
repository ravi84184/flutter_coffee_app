import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl({required this.dataSource});

  @override
  Future<List<Product>> getAllProducts() async {
    return await dataSource.getAllProducts();
  }

  @override
  Future<Product> getProductById(String id) async {
    return await dataSource.getProductById(id);
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    return await dataSource.getProductsByCategory(category);
  }

  @override
  Future<List<Product>> getPopularProducts() async {
    return await dataSource.getPopularProducts();
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    return await dataSource.searchProducts(query);
  }
}
