// ignore_for_file: cascade_invocations, public_member_api_docs

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/feature/home/view/mixin/home_view_mixin.dart';
import 'package:movitty/feature/home/view/widget/home_headers.dart';
import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/state/base/base_state.dart';
import 'package:movitty/product/utility/constants/decoration/index.dart';
import 'package:movitty/product/utility/validator/password_validator.dart';

@RoutePage()
final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  late PasswordValidator _passwordValidator;

  @override
  void initState() {
    super.initState();
    log('HomeView init');
    _passwordValidator = PasswordValidator(_controller2.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: BlocBuilder<HomeViewModel, HomeState>(
        builder: (context, state) {
          return SizedBox(
            height: context.general.mediaSize.height,
            width: double.infinity,
            child: ListView(
              children: [
                const HomeHeaders(),
                ProjectSpacer.mediumHeight(context),
                //const HomeSections(),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* final class _UserBlocList extends StatelessWidget {
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
} */
