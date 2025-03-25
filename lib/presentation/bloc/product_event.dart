abstract class ProductEvent {}

class GetProductsByCategory extends ProductEvent {
  final String category;

  GetProductsByCategory(this.category);
}

class GetPopularProducts extends ProductEvent {}

class SearchProducts extends ProductEvent {
  final String query;

  SearchProducts(this.query);
}
