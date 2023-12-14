import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movitty/feature/auth/signup/view/mixin/signup_view_mixin.dart';
import 'package:movitty/feature/auth/signup/view_model/signup_view_model.dart';
import 'package:movitty/feature/auth/signup/view_model/state/signup_state.dart';
import 'package:movitty/product/state/base/base_state.dart';
import 'package:movitty/product/utility/constants/index.dart';
import 'package:movitty/product/widget/appbar/auth_app_bar.dart';
import 'package:movitty/product/widget/button/custom_signup/custom_signup_button.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';
import 'package:movitty/product/widget/textfield/project_text_field.dart';

@RoutePage()
class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends BaseState<SignupView> with SignupViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signupViewModel,
      child: BlocBuilder<SignupViewModel, SignupState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const AuthAppBar(isBackButtonVisible: true),
            body: Padding(
              padding: ProjectPadding.horizontalMedium(context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectSpacer.xLargeHeight(context),
                    ProjectSpacer.xLargeHeight(context),
                    Text('Kayıt Ol', style: TextStyles.header1(context)),
                    ProjectSpacer.xLargeHeight(context),
                    ProjectSpacer.xLargeHeight(context),
                    ProjectTextField(
                      isActive: signupViewModel.state.isLoading == false,
                      controller: usernameController,
                      isPassword: false,
                      label: usernameLabel,
                      hintText: usernameHint,
                      prefixIcon: usernameFieldIcon,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: usernameValidator,
                    ),
                    ProjectSpacer.largeHeight(context),
                    ProjectTextField(
                      isActive: signupViewModel.state.isLoading == false,
                      controller: emailController,
                      isPassword: false,
                      label: emailLabel,
                      hintText: emailHint,
                      prefixIcon: emailFieldIcon,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: emailValidator,
                      onValidate: (validation) {
                        print('validation: $validation');
                      },
                    ),
                    ProjectSpacer.largeHeight(context),
                    ProjectTextField(
                      isActive: signupViewModel.state.isLoading == false,
                      controller: passwordController,
                      isPassword: true,
                      label: passwordLabel,
                      hintText: passwordHint,
                      prefixIcon: passwordFieldIcon,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      validator: passwordValidator,
                      onValidate: (validation) {
                        print('validation: $validation');
                      },
                    ),
                    ProjectSpacer.largeHeight(context),
                    ProjectTextField(
                      isActive: signupViewModel.state.isLoading == false,
                      controller: confirmPasswordController,
                      isPassword: true,
                      label: confirmPasswordLabel,
                      hintText: confirmPasswordHint,
                      prefixIcon: confirmPasswordFieldIcon,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                    ProjectSpacer.xLargeHeight(context),
                    CustomSignupButton(
                      onOperation: signupViewModel.signup,
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
