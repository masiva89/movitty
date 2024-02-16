import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/feature/dashboard/view/dashboard_view.dart';
import 'package:movitty/feature/home/view/widget/general/home_app_bar.dart';
import 'package:movitty/product/navigation/inner_paths.dart';
import 'package:movitty/product/widget/appbar/appbar_switcher.dart';
import 'package:movitty/product/widget/button/index.dart';

/// Manage your dashboard view business logic.
mixin DashboardMixin on State<DashboardView> {
  /// A mixin that provides a GlobalKey<NavigatorState> for navigation purposes.
  /// This key can be used to access the navigator state and perform navigation
  /// actions.
  late GlobalKey<NavigatorState> _navigatorKey;

  /// Builds an app bar which wraps all child widgets.
  PreferredSizeWidget appBarBuilder(
    BuildContext context,
    TabsRouter tabsRouter,
  ) {
    /* log('appBarBuilder');
    log('tabsRouter.activeIndex: ${tabsRouter.activeIndex}');
    log('tabsRouter.current.name: ${tabsRouter.current.name}');
    log('tabsRouter.current.path: ${tabsRouter.current.path}');
    log('tabsRouter.currentPath: ${tabsRouter.currentPath}');
    log('tabsRouter.current.meta: ${tabsRouter.current.meta}');
    log('tabsRouter.current.parent: ${tabsRouter.current.parent?.name}');
    log('tabsRouter.routeData.path: ${tabsRouter.routeData.path}');
    log('tabsRouter.routeData.name: ${tabsRouter.routeData.name}');
    log('tabsRouter.routeData.route: ${tabsRouter.routeData.route}');
    log('tabsRouter.routeData.parent: ${tabsRouter.routeData.parent?.name}');
    log('-------'); */
    _navigatorKey = _getNavigatorKey(tabsRouter);
    return AppBarSwitcher(
      appBar: _isOnMainRoute(tabsRouter)
          ? const HomeAppBar()
          : AppBar(
              leadingWidth: context.sized.highValue,
              leading: NavigateBackButton(
                title: 'Geri',
                onPressed: () {
                  log('onPressed');
                  try {
                    _navigatorKey.currentState?.pop();
                  } catch (e) {
                    log('error: $e');
                  }
                },
              ),
            ),
    );
    //TODO: make the above code cleaner
    /* final isInDashboard = _isOnMainRoute(tabsRouter);
    if (isInDashboard) return const HomeAppBar();
    return AppBar(
      leadingWidth: context.sized.highValue,
      leading: NavigateBackButton(
        title: 'Geri',
        onPressed: () {
          log('onPressed');
          try {
            _navigatorKey.currentState?.pop();
          } catch (e) {
            log('error: $e');
          }
        },
      ),
    ); */
  }

  bool _isOnMainRoute(TabsRouter tabsRouter) {
    const pathLimit = 2;
    final currentPath = tabsRouter.currentPath;
    final currentPathChildren = currentPath.split('/');
    if (currentPathChildren.firstOrNull == '') {
      currentPathChildren.removeAt(0);
    }
    print('currentPath: $currentPathChildren');
    final currentPathLength = currentPathChildren.length;
    print('currentPathLength: $currentPathLength');
    return currentPathLength <= pathLimit;
  }

  GlobalKey<NavigatorState> _getNavigatorKey(TabsRouter router) {
    return _getNavigatorPath(router).toInnerPath.navigatorKey;
  }

  String _getNavigatorPath(TabsRouter router) {
    final path = router.current.path;
    final pathChildren = path.split('/');
    if (pathChildren.firstOrNull == '') {
      pathChildren.removeAt(0);
    }
    return pathChildren.lastOrNull ?? 'unknown';
  }
}
