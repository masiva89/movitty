// ignore_for_file: public_member_api_docs

import 'package:gen/gen.dart';
import 'package:movitty/product/service/interface/authentication_operation.dart';
import 'package:movitty/product/service/manager/product_service_path.dart';
import 'package:movitty/product/service/manager/product_service_warning_manager.dart';
import 'package:vexana/vexana.dart';

final class SignupService extends AuthenticationOperation {
  SignupService(INetworkManager<EmptyModel> networkManager)
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
  Future<BaseResponseModel> signUp({
    required String username,
    required String password,
    required String email,
    required String passwordConfirmation,
    required int agreement,
  }) async {
    final response =
        await _networkManager.send<BaseResponseModel, BaseResponseModel>(
      ProductServicePath.signUp.value,
      parseModel: BaseResponseModel<EmptyModel>(),
      method: RequestType.POST,
      data: {
        'username': username,
        'password': password,
        'email': email,
        'password_confirmation': passwordConfirmation,
        'agreement': agreement,
      },
    );
    warningManager.handleResponse(response.data, type: NetworkHandleType.both);
    return response.data ?? BaseResponseModel<EmptyModel>.empty();
  }

  @override
  Future<ProductUser> login({
    required String username,
    required String password,
    required String firebaseToken,
  }) {
    throw UnimplementedError();
  }
}
