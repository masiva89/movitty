import 'dart:developer';

import 'package:dio/src/response.dart';
import 'package:movitty/product/service/mock/mock_response_loader.dart';
import 'package:movitty/product/service/mock/mock_response_type.dart';
import 'package:vexana/vexana.dart';

/// A mock interceptor that implements the [Interceptor] interface.
class MockInterceptor implements Interceptor {
  final _jsonDir = 'assets/mock/';

  final _responseType = MockResponseType.success;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {}

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log('--------------------------------------------');
    log('MockInterceptor.onRequest [URI]: ${options.uri}');
    log('MockInterceptor.onRequest [METHOD]: ${options.method}');
    log('MockInterceptor.onRequest [DATA]: ${options.data}');
    log('MockInterceptor.onRequest [HEADERS]: ${options.headers}');
    log('MockInterceptor.onRequest [PATH]: ${options.path}');
    log('--------------------------------------------');
    final resourcePath = _jsonDir + options.path;
    final mockResponse = await MockResponseLoader.loadResponse(
      path: resourcePath,
      responseType: _responseType,
    );
    if (_responseType == MockResponseType.success) {
      handler.resolve(mockResponse);
    } else {
      handler.reject(
        DioException.badResponse(
          statusCode: 400,
          requestOptions: options,
          response: mockResponse,
        ),
      );
    }
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {}
}
