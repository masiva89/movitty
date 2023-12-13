// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movitty/feature/dashboard/view/mixin/dashboard_mixin.dart';
import 'package:movitty/main.dart';
import 'package:movitty/product/navigation/app_router.dart';
import 'package:movitty/product/widget/navigation/custom_navigation_bar.dart';

@RoutePage()
class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with DashboardMixin {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: appBarBuilder,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /* productViewModel.changeThemeMode(ThemeMode.dark);
            await homeViewModel.fetchUsers(); */
          //await globalScaffoldKey.currentState?.context.router.push(HomeDetailRoute(id: 'id'));
          //await context.router.replace(HomeDetailRoute(id: 'id'));
          /* await context.router.navigate(
              DashboardRoute(children: [HomeDetailRoute(id: 'id')]),
            ); */
          await context.router.push(const HomeSecondRoute());
        },
      ),
      routes: [
        const HomeRoute(),
        HomeDetailRoute(id: 'id'),
      ],
      scaffoldKey: globalScaffoldKey,
      animationDuration: const Duration(milliseconds: 500),
      animationCurve: Curves.easeInOut,
      bottomNavigationBuilder: (_, tabsRouter) {
        return CustomNavigationBar(tabsRouter: tabsRouter);
      },
    );
  }
}
