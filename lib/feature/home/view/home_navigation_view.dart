// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeNavigationView extends StatelessWidget {
  const HomeNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
