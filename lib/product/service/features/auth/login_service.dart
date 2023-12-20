// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:gen/gen.dart';
import 'package:movitty/product/service/interface/index.dart';
import 'package:movitty/product/service/manager/product_service_path.dart';
import 'package:movitty/product/service/manager/product_service_warning_manager.dart';
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
  Future<ProductUser> login({
    required String username,
    required String password,
    required String firebaseToken,
  }) async {
    final response = await _networkManager
        .send<BaseResponseModel<ProductUser>, BaseResponseModel<ProductUser>>(
      ProductServicePath.login.value,
      parseModel: BaseResponseModel<ProductUser>(),
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
    warningManager.handleResponse(response.data, type: NetworkHandleType.both);
    log(
      'SUCCESS: ${response.data?.success}',
      name: 'LoginService.login',
    );
    log(
      'MESSAGE: ${response.data?.message}',
      name: 'LoginService.login',
    );
    return response.data?.data ?? ProductUser.empty();
  }

  @override
  Future<BaseResponseModel> signUp({
    required String username,
    required String password,
    required String email,
    required String passwordConfirmation,
    required int agreement,
  }) {
    throw UnimplementedError();
  }
}
