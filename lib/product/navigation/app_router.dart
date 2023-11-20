import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movitty/feature/auth/login/view/login_view.dart';
import 'package:movitty/feature/auth/signup/view/signup_view.dart';
import 'package:movitty/feature/dashboard/view/dashboard_view.dart';
import 'package:movitty/feature/home/view/home_detail_view.dart';
import 'package:movitty/feature/home/view/home_navigation_view.dart';
import 'package:movitty/feature/home/view/home_second_view.dart';
import 'package:movitty/feature/home/view/home_view.dart';
import 'package:movitty/product/navigation/guard/auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)

/// Project router information class
final class AppRouter extends _$AppRouter {
  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: SignupRoute.page,
          path: '/signup',
        ),
        AdaptiveRoute(
          page: DashboardRoute.page,
          initial: true,
          path: '/dashboard',
          children: [
            AutoRoute(
              page: HomeNavigationRoute.page,
              path: 'home_navigation',
              type: const RouteType.adaptive(),
              guards: [
                AuthGuard(),
              ],
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                  path: '',
                  initial: true,
                ),
                AutoRoute(
                  page: HomeSecondRoute.page,
                  path: 'second',
                  type: const RouteType.adaptive(),
                ),
              ],
            ),
            AutoRoute(
              page: HomeDetailRoute.page,
              path: 'detail',
            ),
          ],
        ),
      ];
}
