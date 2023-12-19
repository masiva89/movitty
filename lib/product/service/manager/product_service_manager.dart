import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/product/service/manager/product_interceptor_manager.dart';
import 'package:vexana/vexana.dart';

/// A class that manages network requests for products.
///
/// This class extends the [NetworkManager] class and is specialized for
/// handling requests related to products.
/// It provides methods for handling errors and listening to error states.
class ProductNetworkManager extends NetworkManager<EmptyModel> {
  /// Constructs a [ProductNetworkManager] with the required dependencies.
  ///
  /// The [config] parameter is an instance of [AppConfiguration] that contains
  /// the application configuration.
  ProductNetworkManager.base(AppConfiguration config)
      : super(
          options: BaseOptions(
            baseUrl: config.baseUrl,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
          isEnableLogger: config is DevEnv,
          interceptor: ProductInterceptorManager.get(config),
          isEnableTest: config is DevEnv,
        ) {
    /* final initialInterceptor = ProductInterceptorManager.get(config);
    if (initialInterceptor != null) {
      interceptors.add(initialInterceptor);
    } */
  }

  /// Listens to error states and invokes the provided [onErrorStatus]
  /// callback when an error occurs.
  ///
  /// The [onErrorStatus] callback is called with the error status code,
  /// which is an [int] value representing the HTTP status code.
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(e);
        },
      ),
    );
  }
}
