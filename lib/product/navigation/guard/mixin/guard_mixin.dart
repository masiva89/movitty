import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:movitty/product/cache/path/cache_path.dart';
import 'package:movitty/product/cache/product_cache.dart';
import 'package:movitty/product/navigation/guard/user_status.dart';
import 'package:movitty/product/state/container/index.dart';

/// [GuardMixin] is a mixin for guards.
mixin GuardMixin on AutoRouteGuard {
  ProductCache get _productCache => ProductStateItems.productCache;

  UserStatus get userAuthStatus {
    log('[userAuthStatus]');
    final authCacheModel =
        _productCache.authCacheModel.get(CachePath.auth.value);
    if (authCacheModel == null) return UserStatus.notLoggedIn;

    return authCacheModel.userStatus;
  }
}
