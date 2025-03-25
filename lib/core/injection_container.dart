import 'package:get_it/get_it.dart';
import '../data/datasources/product_data_source.dart';
import '../data/repositories/product_repository_impl.dart';
import '../domain/repositories/product_repository.dart';
import '../domain/usecases/get_products_usecase.dart';
import '../presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(
    () => ProductBloc(
      getProductsUseCase: sl(),
      getPopularProductsUseCase: sl(),
      searchProductsUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularProductsUseCase(sl()));
  sl.registerLazySingleton(() => SearchProductsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(dataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ProductDataSource>(
    () => RemoteProductDataSource(baseUrl: 'YOUR_API_BASE_URL'),
  );
}
