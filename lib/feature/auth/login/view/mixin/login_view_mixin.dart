// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/feature/auth/login/view/login_view.dart';
import 'package:movitty/feature/auth/login/view_model/login_view_model.dart';
import 'package:movitty/product/service/features/auth/login_service.dart';
import 'package:movitty/product/service/manager/product_network_error_manager.dart';
import 'package:movitty/product/state/base/base_state.dart';
import 'package:movitty/product/state/container/product_state_items.dart';

mixin LoginViewMixin on BaseState<LoginView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final LoginViewModel _loginViewModel;

  LoginViewModel get loginViewModel => _loginViewModel;

  String get usernameLabel => 'E-posta';
  String get usernameHint => 'E-posta adresinizi giriniz';

  String get passwordLabel => 'Şifre';
  String get passwordHint => 'Şifrenizi giriniz';

  TextEditingController get usernameController =>
      _loginViewModel.usernameController;

  TextEditingController get passwordController =>
      _loginViewModel.passwordController;

  SvgGenImage get usernameFieldIcon => Assets.icons.mail;
  SvgGenImage get passwordFieldIcon => Assets.icons.password;

  /* ITextFieldValidator get passwordValidator => LoginPasswordValidator(
        passwordController.text,
      ); */

  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(
      context: context,
      productCache: ProductStateItems.productCache,
    );

    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );

    _loginViewModel = LoginViewModel(
      operationService: LoginService(productNetworkManager),
      authCacheOperation: ProductStateItems.productCache.authCacheModel,
    );
  }
}
