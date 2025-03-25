abstract class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}

class Coffee extends Product {
  final String roastLevel;
  final bool isHot;

  Coffee({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.description,
    required this.roastLevel,
    required this.isHot,
  });
}

class Beverage extends Product {
  final bool isCold;
  final String category;

  Beverage({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.description,
    required this.isCold,
    required this.category,
  });
}
