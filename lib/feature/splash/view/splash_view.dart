import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/feature/splash/view/mixin/splash_view_mixin.dart';
import 'package:movitty/product/state/base/base_state.dart';

@RoutePage()

/// A widget that represents the splash screen view of the Movitty app.
class SplashView extends StatefulWidget {
  /// Constructs a [SplashView] with the required dependencies.
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> with SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashViewModel,
      child: Scaffold(
        body: Center(
          child: Assets.images.mainLogoFullSvg.svg(
            package: 'gen',
            width: context.general.mediaSize.width * 0.8,
          ),
        ),
      ),
    );
  }
}
