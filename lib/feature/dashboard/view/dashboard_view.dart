// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movitty/main.dart';
import 'package:movitty/product/navigation/app_router.dart';

@RoutePage()
class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      /* appBarBuilder: (_, tabsRouter) {
        return AppBar(
          title: Text(
            tabsRouter.current.name,
          ),
        );
      }, */
      routes: [
        const HomeRoute(),
        HomeDetailRoute(id: 'id'),
      ],
      scaffoldKey: globalScaffoldKey,
      animationDuration: const Duration(milliseconds: 500),
      animationCurve: Curves.easeInOut,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
