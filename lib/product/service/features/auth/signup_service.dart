// ignore_for_file: public_member_api_docs

import 'package:gen/gen.dart';
import 'package:movitty/product/service/interface/authentication_operation.dart';
import 'package:movitty/product/service/manager/product_service_path.dart';
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
  Future<EmptyNetworkModel> signUp(
    String username,
    String password,
    String email,
    String passwordConfirmation,
    int agreement,
  ) async {
    final response =
        await _networkManager.send<EmptyNetworkModel, EmptyNetworkModel>(
      ProductServicePath.signUp.value,
      parseModel: EmptyNetworkModel(),
      method: RequestType.POST,
      data: {
        'username': username,
        'password': password,
        'email': email,
        'password_confirmation': passwordConfirmation,
        'agreement': agreement,
      },
    );
    return response.data ?? EmptyNetworkModel.empty();
  }

  @override
  Future<ProductUser> login(
    String username,
    String password,
    String firebaseToken,
  ) {
    throw UnimplementedError();
  }
}
