import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_products_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;
  final GetPopularProductsUseCase getPopularProductsUseCase;
  final SearchProductsUseCase searchProductsUseCase;

  ProductBloc({
    required this.getProductsUseCase,
    required this.getPopularProductsUseCase,
    required this.searchProductsUseCase,
  }) : super(ProductInitial()) {
    on<GetProductsByCategory>(_onGetProductsByCategory);
    on<GetPopularProducts>(_onGetPopularProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  Future<void> _onGetProductsByCategory(
    GetProductsByCategory event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await getProductsUseCase.execute(event.category);
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onGetPopularProducts(
    GetPopularProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await getPopularProductsUseCase.execute();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onSearchProducts(
    SearchProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await searchProductsUseCase.execute(event.query);
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
