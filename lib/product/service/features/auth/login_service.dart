// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:gen/gen.dart';
import 'package:movitty/product/service/interface/index.dart';
import 'package:movitty/product/service/manager/product_service_path.dart';
import 'package:vexana/vexana.dart';

final class LoginService extends AuthenticationOperation {
  LoginService(INetworkManager<EmptyModel> networkManager)
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<List<User>> users() async {
    final response = await _networkManager.send<User, List<User>>(
      ProductServicePath.posts.value,
      parseModel: User(),
      method: RequestType.GET,
    );

    return response.data ?? [];
  }

  @override
  Future<ProductUser> login(
    String username,
    String password,
    String firebaseToken,
  ) async {
    final response = await _networkManager.send<ProductUser, ProductUser>(
      ProductServicePath.login.value,
      parseModel: ProductUser(),
      method: RequestType.POST,
      isErrorDialog: true,
      onReceiveProgress: (progress, total) {
        log('progress: $progress, total: $total', name: 'LoginService.login');
      },
      data: {
        'username': username,
        'password': password,
        'firebase_token': firebaseToken,
      },
    );
    log('response: $response', name: 'LoginService.login');
    log('response.data: ${response.data}', name: 'LoginService.login');
    log('response.error: ${response.error}', name: 'LoginService.login');
    log(
      'response.error.description: ${response.error?.description}',
      name: 'LoginService.login',
    );
    log(
      'response.error.statusCode: ${response.error?.statusCode}',
      name: 'LoginService.login',
    );
    return response.data ?? ProductUser.empty();
  }

  @override
  Future<EmptyNetworkModel> signUp(
    String username,
    String password,
    String email,
    String passwordConfirmation,
    int agreement,
  ) {
    throw UnimplementedError();
  }
}
