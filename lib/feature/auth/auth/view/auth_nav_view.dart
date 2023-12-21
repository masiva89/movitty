import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// A global key to manage the auth navigation state.
final authNavigationKey = GlobalKey<NavigatorState>();

@RoutePage()

/// A view that represents the auth navigation in the app.
/// It contains a [Navigator] widget and a [GlobalKey] to manage the navigation
/// state.
class AuthNavView extends StatelessWidget {
  /// A view that represents the auth navigation in the app.
  const AuthNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter(navigatorKey: authNavigationKey);
  }
}
