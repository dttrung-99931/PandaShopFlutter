// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:evievm_app/core/utils/constants.dart';
import 'package:evievm_app/core/utils/extensions/list_extension.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CacheProvider {
  /// DI CacheStore
  /// So we can receive it from getIt<CacheStore>() to handle deleting cache,... latter
  @singleton
  CacheStore provideCacheStore() {
    return MemCacheStore();
  }

  @singleton
  CacheOptions provideBaseCacheOptions(CacheStore cacheStore) {
    return CacheOptions(
      store: cacheStore,
      maxStale: Constants.defaultAPICacheTime,
      // policy: when should cache
      // CachePolicy.forceCache => awlays cache all requests
      // CachePolicy.request => used cache response when server response 304 status
      policy: CachePolicy.forceCache,
      hitCacheOnErrorExcept: [401, 403],
      priority: CachePriority.normal,
      // Custom keyBuilder when you want to control delete cache programatically
      // keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
      cipher: null,
    );
  }

  @singleton
  CacheMaxStaleModifierInterceptor provideCacheMaxStaleModifierInterceptor(CacheOptions cacheOptions) {
    return CacheMaxStaleModifierInterceptor(baseCacheOptions: cacheOptions);
  }

  @singleton
  DioCacheInterceptor provideDioCacheInterceptor(CacheOptions cacheOptions) {
    return DioCacheInterceptor(options: cacheOptions);
  }
}

/// Interceptor to modify maxStale time of CacheOptions by url
///   /cart => 2min
///   /products => 5min
///   ...
/// Note: need add this interceptor before DioCahceInterceptor
class CacheMaxStaleModifierInterceptor extends Interceptor {
  final CacheOptions baseCacheOptions;
  final Map<String, Duration> maxStalesByUrl = {
    '/v1/Products': const Duration(minutes: 5),
    '/v1/carts': const Duration(minutes: 1),
    '/v1/Categories': const Duration(minutes: 10),
    '/v1/Orders': const Duration(minutes: 1),
  };
  CacheMaxStaleModifierInterceptor({required this.baseCacheOptions});

  /// Set maxStale modified CacheOptions to options.extra
  /// maxStale is modifier by url. See [maxStalesByUrl]
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String uri = options.uri.toString();
    final Duration? maxStale = maxStalesByUrl.entries
        .firstWhereOrNull(
          (entry) => uri.contains(entry.key),
        )
        ?.value;
    if (maxStale != null) {
      // Set the modified CacheOptions to extra for DioCacheInterceptor on the next
      options.extra = baseCacheOptions.copyWith(maxStale: Nullable(maxStale)).toExtra();
    }
    handler.next(options);
  }
}
