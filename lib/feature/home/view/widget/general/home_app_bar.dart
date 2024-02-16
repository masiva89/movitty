import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/state/base/base_equatable.dart';
import 'package:movitty/product/utility/constants/index.dart';
import 'package:widgets/widgets.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Assets.images.mainLogoSvg.svg(
        package: 'gen',
        height: ProjectSize.xxlarge.responsive(context),
      ),
    );
    /* AppBar(
      title: const Text('Home'),
      titleTextStyle: const TextStyle(
        color: Colors.white,
      ),
      /* actions: const [
        _Loading(),
      ], */
    ); */
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

@immutable
class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (state.status == StateType.LOADING.opposite) {
          return const SizedBox.shrink();
        }
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}
