// ignore_for_file: public_member_api_docs

import 'package:core/core.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/feature/auth/signup/view_model/cubit/signup_cubit.dart';
import 'package:movitty/feature/auth/signup/view_model/state/signup_state.dart';
import 'package:movitty/product/cache/model/user_cache_model.dart';
import 'package:movitty/product/service/interface/authentication_operation.dart';
import 'package:movitty/product/utility/validator/form_validator.dart';

final class SignupViewModel extends SignupCubit {
  SignupViewModel({
    required AuthenticationOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheModel,
    required FormValidator formValidator,
  })  : _authenticationOperationService = operationService,
        _userCacheOperation = userCacheModel,
        _formValidator = formValidator,
        super(const SignupState(isLoading: false));

  final AuthenticationOperation _authenticationOperationService;
  final HiveCacheOperation<UserCacheModel> _userCacheOperation;
  final FormValidator _formValidator;
  /* 

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController(); */
  @override
  void initialEvent(BuildContext? context) {}

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  @override
  Future<bool> onPressedSignup() async {
    changeLoading();
    try {
      await _authenticationOperationService.signUp(
        username: 'username',
        password: 'password',
        email: 'email',
        passwordConfirmation: 'passwordConfirmation',
        agreement: 1,
      );
    } catch (e) {
      CustomLogger.showError<Exception>(e);
      changeLoading();
      return false;
    }
    changeLoading();
    return true;
    /* if (!_formValidator.validate()) {
      /* ProjectSnackbar(
        message: 'Lütfen kayıt formunu doğru ve eksiksiz doldurunuz.',
        type: ProjectSnackbarType.error,
      ).show(); */
      emit(state);
      return false;
    }
    changeLoading();
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      ProjectSnackbar(
        title: 'Başarılı!',
        message:
            'Hesabın başarıyla oluşturuldu. Şimdi ilk önce giriş yapmalısın.',
        type: ProjectSnackbarType.success,
      ).show();
    });
    changeLoading();
    print('signup'); */
  }
}
