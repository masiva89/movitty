import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:movitty/product/cache/product_cache.dart';
import 'package:movitty/product/service/manager/product_service_manager.dart';
import 'package:movitty/product/state/view_model/product_view_model.dart';

/// Product container for dependency injection
final class ProductContainer {
  const ProductContainer._();
  static final _getIt = GetIt.I;

  /// Product core required items
  ///
  /// [AppConfiguration] is a class that contains the application configuration:
  /// [DevEnv] and [ProdEnv] are the classes that contain the application
  /// environment configuration.
  static void setup(AppConfiguration config) {
    Logger().i('ProductContainer setup');
    Logger().i('Environment: ${config.runtimeType}');
    _getIt
      ..registerSingleton(ProductCache(cacheManager: HiveCacheManager()))
      ..registerSingleton<ProductNetworkManager>(
        ProductNetworkManager.base(config),
      )
      ..registerLazySingleton<ProductViewModel>(
        ProductViewModel.new,
      );
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
