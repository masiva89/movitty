// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movitty/feature/auth/login/view/mixin/login_view_mixin.dart';
import 'package:movitty/feature/auth/login/view_model/login_view_model.dart';
import 'package:movitty/feature/auth/login/view_model/state/login_state.dart';
import 'package:movitty/product/navigation/app_router.dart';
import 'package:movitty/product/state/base/base_state.dart';
import 'package:movitty/product/utility/constants/decoration/project_spacer.dart';
import 'package:movitty/product/utility/constants/decoration/text_styles.dart';
import 'package:movitty/product/widget/appbar/auth_appbar.dart';
import 'package:movitty/product/widget/button/custom_login/custom_login_button.dart';
import 'package:movitty/product/widget/button/custom_text_button.dart';
import 'package:movitty/product/widget/button/normal_button.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';
import 'package:movitty/product/widget/textfield/project_text_field.dart';

@RoutePage()
final class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: BlocBuilder<LoginViewModel, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const AuthAppBar(),
            body: Padding(
              padding: ProjectPadding.horizontalMedium(context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectSpacer.xLargeHeight(context),
                    ProjectSpacer.xLargeHeight(context),
                    Text('Giriş Yap', style: TextStyles.header1(context)),
                    ProjectSpacer.xLargeHeight(context),
                    ProjectSpacer.xLargeHeight(context),
                    ProjectTextField(
                      isActive: loginViewModel.state.isLoading == false,
                      controller: usernameController,
                      isPassword: false,
                      label: usernameLabel,
                      hintText: usernameHint,
                      prefixIcon: usernameFieldIcon,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    ProjectSpacer.largeHeight(context),
                    ProjectTextField(
                      isActive: loginViewModel.state.isLoading == false,
                      controller: passwordController,
                      isPassword: true,
                      label: passwordLabel,
                      hintText: passwordHint,
                      prefixIcon: passwordFieldIcon,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                    ProjectSpacer.mediumHeight(context),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButton(
                        title: 'Şifremi Unuttum',
                        onPressed: () {},
                      ),
                    ),
                    ProjectSpacer.xLargeHeight(context),
                    CustomLoginButton(
                      onOperation: loginViewModel.login,
                    ),
                    ProjectSpacer.xLargeHeight(context),
                    NormalButton(
                      onPressed: () {
                        context.pushRoute(const SignupRoute());
                      },
                      isActive: state.isLoading == false,
                      isPrimary: false,
                      title: 'Hesabın yok mu? Kayıt Ol',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
