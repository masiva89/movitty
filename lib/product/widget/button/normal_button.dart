import 'package:flutter/material.dart';
import 'package:movitty/product/utility/constans/project_radius.dart';

/// radius is 20
final class NormalButton extends StatelessWidget {
  const NormalButton({required this.title, required this.onPressed, super.key});

  /// title text
  final String title;

  /// button on pressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      /// todo:
      radius: ProjectRadius.normal.value,
      onTap: onPressed,
      child: Text(title),
    );
  }
}
