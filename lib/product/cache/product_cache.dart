import 'package:core/core.dart';
import 'package:movitty/product/cache/model/auth_cache_model.dart';
import 'package:movitty/product/cache/model/user_cache_model.dart';

/// [ProductCache] is a cache manager for the product module.
final class ProductCache {
  /// constructor
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [
        UserCacheModel.empty(),
        AuthCacheModel.empty(),
      ],
    );
  }

  /// [userCacheOperation] is a cache operation for [UserCacheModel].
  late final HiveCacheOperation<UserCacheModel> userCacheOperation =
      HiveCacheOperation<UserCacheModel>();

  /// [authCacheModel] is a cache operation for [AuthCacheModel].
  late final HiveCacheOperation<AuthCacheModel> authCacheModel =
      HiveCacheOperation<AuthCacheModel>();
}
