# Flutter Coffee App

A beautiful and modern coffee shop application built with Flutter. This app showcases a clean and intuitive UI design for browsing coffee, beer, wine, and other beverages.

## 📱 Design Reference

This project is based on the [Coffee App UI/UX Design](https://www.figma.com/design/irRiGOJiZ1CWYwywwErNwg/Freebie-Coffee-App-UI-UX-Design-(Community)?node-id=1-7924&t=xogym3dRfdCsxlTJ-0) from Figma Community.

## 🏗️ Architecture

This project follows Clean Architecture principles with a clear separation of concerns:

```
lib/
├── core/
│   ├── constants/           # App-wide constants
│   ├── errors/             # Custom error handling
│   ├── network/            # Network related utilities
│   └── usecases/           # Base use case implementations
├── data/
│   ├── datasources/        # Remote and local data sources
│   ├── models/             # Data models and DTOs
│   └── repositories/       # Repository implementations
├── domain/
│   ├── entities/           # Core business entities
│   ├── repositories/       # Repository interfaces
│   └── usecases/          # Business logic use cases
├── presentation/
│   ├── bloc/              # State management
│   ├── pages/             # UI screens
│   └── widgets/           # Reusable UI components
└── main.dart
```

## 🎯 SOLID Principles Implementation

### 1. Single Responsibility Principle (SRP)
- Each class has one specific responsibility
- Example: `ProductRepository` only handles product data operations
```dart
class ProductRepository {
  final ProductDataSource dataSource;
  
  Future<List<Product>> getProducts() async {
    // Handle product fetching
  }
}
```

### 2. Open/Closed Principle (OCP)
- Classes are open for extension but closed for modification
- Example: Abstract base classes for repositories
```dart
abstract class Repository<T> {
  Future<List<T>> getAll();
  Future<T> getById(String id);
}

class CoffeeRepository extends Repository<Coffee> {
  // Implementation
}
```

### 3. Liskov Substitution Principle (LSP)
- Derived classes must be substitutable for their base classes
- Example: Product types hierarchy
```dart
abstract class Product {
  String name;
  double price;
}

class Coffee extends Product {
  String roastLevel;
}

class Beverage extends Product {
  bool isCold;
}
```

### 4. Interface Segregation Principle (ISP)
- Clients shouldn't depend on interfaces they don't use
- Example: Separate interfaces for different functionalities
```dart
abstract class ProductViewer {
  void display();
}

abstract class ProductPurchaser {
  void addToCart();
}

class CoffeeItem implements ProductViewer, ProductPurchaser {
  // Implementation
}
```

### 5. Dependency Inversion Principle (DIP)
- High-level modules shouldn't depend on low-level modules
- Example: Repository pattern implementation
```dart
abstract class ProductRepository {
  Future<List<Product>> getProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  final ApiClient apiClient;
  
  // Implementation
}
```

## 🧹 Clean Code Practices

1. **Dependency Injection**
   - Using `get_it` for service location
   - Proper initialization in `main.dart`

2. **State Management**
   - BLoC pattern for complex state management
   - Provider for simpler states
   - Clear separation of UI and business logic

3. **Error Handling**
   - Custom error types
   - Proper error propagation
   - User-friendly error messages

4. **Testing**
   ```dart
   test/
   ├── unit/
   │   ├── repositories/
   │   └── usecases/
   ├── widget/
   └── integration/
   ```

5. **Code Organization**
   - Feature-first organization
   - Consistent file naming
   - Clear module boundaries

## ✨ Features

- Modern and clean UI design
- Responsive layout
- Custom animations and transitions
- Category-based filtering
- Product showcasing
- Search functionality
- User profile integration

## 🛠️ Project Structure

```
lib/
├── screens/
│   ├── home_screen.dart       # Main home screen with product listings
│   ├── sign_in_screen.dart    # User authentication screen
│   └── sign_up_screen.dart    # New user registration screen
├── widgets/
│   └── custom_widgets.dart    # Reusable UI components
├── models/
│   └── product.dart          # Data models
└── main.dart                 # App entry point
```

## 🎯 Sections

1. **Header Section**
   - Profile picture
   - Welcome message
   - Search bar with filter

2. **Categories**
   - Coffee
   - Beer
   - Wine Bar
   - Events

3. **Product Sections**
   - Popular Now (Horizontal scroll)
   - Frozen Beverages (Grid layout)
   - Kava and Bottled Beverages (Horizontal scroll)

4. **Navigation**
   - Home
   - Favorites
   - Cart
   - Profile

## 🎨 Color Scheme

- Primary Brown: `#6B4731`
- Primary Orange: `#C67C4E`
- Dark Text: `#2F2D2C`
- Light Gray: `#F3F3F3`
- White: `#FFFFFF`

## 🔤 Typography

The app uses the Gilroy font family with various weights:
- Regular (400)
- Medium (500)
- SemiBold (600)

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  # Add other dependencies as needed
```

## 🚀 Getting Started

1. Clone the repository:
```bash
git clone https://github.com/yourusername/flutter_coffee_app.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📱 Screenshots

[Add your app screenshots here]

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](link-to-issues).

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Design inspiration from [Coffee App UI/UX Design](https://www.figma.com/design/irRiGOJiZ1CWYwywwErNwg/Freebie-Coffee-App-UI-UX-Design-(Community)?node-id=1-7924&t=xogym3dRfdCsxlTJ-0)
- Flutter and Dart teams for the amazing framework
