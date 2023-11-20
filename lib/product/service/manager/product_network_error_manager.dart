import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:movitty/product/cache/product_cache.dart';

/// Manage your network error with screen
final class ProductNetworkErrorManager {
  /// Manage your network error with screen
  const ProductNetworkErrorManager({
    required this.context,
    required this.productCache,
  });

  /// The context of the screen where the error occurred.
  final BuildContext context;

  /// The cache manager of the product module.
  /// You can use it to access the cache to make changes
  /// when an error occurs.
  final ProductCache productCache;

  /// The method of deciding what to do when an error occurs.
  /// Method decides what to do with switch-case according to the [value].
  ///
  /// [value] is the status code of the response.
  ///
  /// *You can add your error handler here.
  void handleError(int value) {
    switch (value) {
      case HttpStatus.badRequest:
        break;
      case HttpStatus.unauthorized:
        break;
      case HttpStatus.forbidden:
        break;
      case HttpStatus.notFound:
        break;
      default:
    }
  }
}
