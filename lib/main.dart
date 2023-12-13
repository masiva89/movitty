import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movitty/product/init/index.dart';
import 'package:movitty/product/navigation/app_router.dart';
import 'package:movitty/product/state/view_model/product_view_model.dart';
import 'package:widgets/widgets.dart';

/// Project navigator key.
final navigatorKey = GlobalKey<NavigatorState>();

/// Project scaffold messenger key.
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

/// Project scaffold key.
final globalScaffoldKey = GlobalKey<ScaffoldState>();
Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: const StateInitialize(child: Movitty())));
}

/// Movitty Initial Widget
class Movitty extends StatelessWidget with MaterialGestureMixin {
  /// Movitty Initial Widget Constructor
  const Movitty({super.key});
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        unFocusAll(context);
      },
      child: MaterialApp.router(
        key: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        routerConfig: _appRouter.config(),
        builder: CustomResponsive.build,
        theme: CustomDarkTheme().themeData,
        darkTheme: CustomDarkTheme().themeData,
        themeMode: context.watch<ProductViewModel>().state.themeMode,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
