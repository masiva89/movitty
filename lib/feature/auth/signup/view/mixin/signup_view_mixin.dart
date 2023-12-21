// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/feature/auth/signup/view/signup_view.dart';
import 'package:movitty/feature/auth/signup/view_model/signup_view_model.dart';
import 'package:movitty/product/service/index.dart';
import 'package:movitty/product/state/index.dart';
import 'package:movitty/product/utility/validator/index.dart';

mixin SignupViewMixin on BaseState<SignupView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final SignupViewModel _signupViewModel;

  SignupViewModel get signupViewModel => _signupViewModel;

  String get usernameLabel => 'Kullanıcı Adı';
  String get usernameHint => 'Kullanıcı adınızı giriniz';

  String get passwordLabel => 'Şifre';
  String get passwordHint => 'Şifrenizi giriniz';

  String get confirmPasswordLabel => 'Şifre Tekrar';
  String get confirmPasswordHint => 'Şifrenizi tekrar giriniz';

  String get emailLabel => 'E-posta';
  String get emailHint => 'E-posta adresinizi giriniz';

  /* TextEditingController get usernameController =>
      _signupViewModel.usernameController;

  TextEditingController get passwordController =>
      _signupViewModel.passwordController;

  TextEditingController get confirmPasswordController =>
      _signupViewModel.confirmPasswordController;

  TextEditingController get emailController => _signupViewModel.emailController; */

  SvgGenImage get usernameFieldIcon => Assets.icons.profile;
  SvgGenImage get passwordFieldIcon => Assets.icons.password;
  SvgGenImage get confirmPasswordFieldIcon => Assets.icons.password;
  SvgGenImage get emailFieldIcon => Assets.icons.mail;

  late ITextFieldValidator usernameValidator;
  late ITextFieldValidator emailValidator;
  late ITextFieldValidator passwordValidator;
  late final FormValidator formValidator;

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

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
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    usernameValidator = UsernameValidator(usernameController.text);
    emailValidator = EmailValidator(emailController.text);
    passwordValidator = PasswordValidator(passwordController.text);
    /* confirmPasswordValidator =
        ConfirmPasswordValidator(confirmPasswordController.text); */

    formValidator = FormValidator(
      validators: [
        passwordValidator,
        emailValidator,
        usernameValidator,
      ],
    );

    _signupViewModel = SignupViewModel(
      formValidator: formValidator,
      operationService: SignupService(productNetworkManager),
      userCacheModel: ProductStateItems.productCache.userCacheOperation,
    );
  }
}
