import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage<bool?>()
final class HomeDetailView extends StatefulWidget {
  const HomeDetailView({required this.id, super.key});
  final String id;

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  @override
  void initState() {
    super.initState();
    log('HomeDetailView init');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Home Detail View'),
      ),
      body: Column(
        children: [
          Text('id: ${widget.id}'),
          ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            child: const Text('Pop'),
          ),
        ],
      ),
    );
  }
}
