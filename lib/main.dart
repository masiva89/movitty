import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movitty/product/init/application_initialize.dart';
import 'package:movitty/product/init/product_localization.dart';
import 'package:movitty/product/init/state_initialize.dart';
import 'package:movitty/product/init/theme/custom_dark_theme.dart';
import 'package:movitty/product/navigation/app_router.dart';
import 'package:movitty/product/state/view_model/product_view_model.dart';
import 'package:widgets/widgets.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: const StateInitialize(child: Movitty())));
}

/// Movitty Initial Widget
final class Movitty extends StatelessWidget {
  /// Movitty Initial Widget Constructor
  const Movitty({super.key});
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: CustomResponsive.build,
      theme: CustomDarkTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: context.watch<ProductViewModel>().state.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
