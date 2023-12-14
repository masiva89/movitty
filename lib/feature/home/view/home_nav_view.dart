import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// A global key to manage the home navigation state.
final homeNavigatorKey = GlobalKey<NavigatorState>();

@RoutePage()

/// A view that represents the home navigation in the app.
/// It contains a [Navigator] widget and a [GlobalKey] to manage the navigation
/// state.
class HomeNavigationView extends StatelessWidget {
  /// A view that represents the home navigation in the app.
  const HomeNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter(navigatorKey: homeNavigatorKey);
  }
}
