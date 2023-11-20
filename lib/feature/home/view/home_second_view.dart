import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movitty/product/navigation/app_router.dart';

@RoutePage()
class HomeSecondView extends StatefulWidget {
  const HomeSecondView({super.key});

  @override
  State<HomeSecondView> createState() => _HomeSecondViewState();
}

class _HomeSecondViewState extends State<HomeSecondView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Second View'),
      ),
      body: Column(
        children: [
          const Text('home 2nd view'),
          ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            child: const Text('Pop'),
          ),
          ElevatedButton(
            onPressed: () async {
              await context.router.navigate(
                DashboardRoute(children: [HomeDetailRoute(id: 'id')]),
              );
            },
            child: const Text('Go to Home Detail'),
          ),
        ],
      ),
    );
  }
}
