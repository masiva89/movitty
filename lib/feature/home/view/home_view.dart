// ignore_for_file: cascade_invocations

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:movitty/feature/home/view/mixin/home_view_mixin.dart';
import 'package:movitty/feature/home/view/widget/home_app_bar.dart';
import 'package:movitty/feature/home/view/widget/home_user_list.dart';
import 'package:movitty/feature/home/view_model/home_view_model.dart';
import 'package:movitty/feature/home/view_model/state/home_state.dart';
import 'package:movitty/product/state/base/base_state.dart';
import 'package:movitty/product/utility/constants/decoration/project_spacer.dart';
import 'package:movitty/product/utility/constants/decoration/text_styles.dart';
import 'package:movitty/product/utility/validator/login_password_validator.dart';
import 'package:movitty/product/widget/button/custom_text_button.dart';
import 'package:movitty/product/widget/textfield/project_text_field.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  late LoginPasswordValidator _passwordValidator;

  @override
  void initState() {
    super.initState();
    _passwordValidator = LoginPasswordValidator(_controller2.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            productViewModel.changeThemeMode(ThemeMode.dark);
            await homeViewModel.fetchUsers();
          },
        ),
        appBar: const HomeAppBar(),
        body: Column(
          children: [
            /* NormalButton(
              title: 'asdas',
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            NormalButton(
              title: 'asdas',
              isPrimary: false,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            MiniButton(
              title: 'asdas',
              onPressed: () {},
            ),
            ProjectSpacer.xLargeHeight(context),
            const DialogNormalButton(
              onComplete: print,
            ),
            /* Expanded(
              child: _UserBlocList(),
            ), */
            Align(
              alignment: Alignment.bottomLeft,
              child: NavigateBackButton(
                title: 'Geri',
                onPressed: () {},
              ),
            ), */
            ProjectSpacer.xLargeHeight(context),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomTextButton(
                title: 'Geri',
                onPressed: () {
                  final operationBottomsheet = OperationBottomsheet(
                    title: 'title',
                    body: Center(
                      child: Text(
                        'asdasds',
                        style: TextStyles.header3(context),
                      ),
                    ),
                    onCancel: () {
                      print('onCancel');
                    },
                    onConfirm: () {
                      print('onConfirm');
                    },
                  );
                  operationBottomsheet.show(
                    context: context,
                    isFixed: false,
                  );
                },
              ),
            ),
            ProjectSpacer.xLargeHeight(context),
            ProjectTextField(
              onChanged: (p0) {},
              prefixIcon: Assets.icons.password,
              controller: _controller2,
              isPassword: true,
              label: 'label',
              hintText: 'hintText',
              validator: LoginPasswordValidator(_controller2.text),
            ),
            ProjectSpacer.xLargeHeight(context),
            ProjectTextField(
              onChanged: (p0) {
                print(_controller1);
              },
              textInputAction: TextInputAction.next,
              prefixIcon: Assets.icons.mail,
              controller: _controller1,
              isPassword: false,
              label: 'label',
              hintText: 'hintText',
            ),
          ],
        ),
      ),
    );
  }
}

final class _UserBlocList extends StatelessWidget {
  const _UserBlocList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      listener: (context, state) {},
      child: BlocSelector<HomeViewModel, HomeState, List<User>>(
        selector: (state) {
          return state.users ?? [];
        },
        builder: (context, state) {
          if (state.isEmpty) return const SizedBox.shrink();

          return HomeUserList(users: state);
        },
      ),
    );
  }
}
