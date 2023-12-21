import 'package:flutter/material.dart';

class BaseWrapperView extends StatefulWidget {
  const BaseWrapperView({required this.child, super.key});
  final Widget child;

  @override
  State<BaseWrapperView> createState() => _BaseWrapperViewState();
}

class _BaseWrapperViewState extends State<BaseWrapperView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.child,
      ],
    );
  }
}
