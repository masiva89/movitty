import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/product/utility/constants/index.dart';

class HomeHeaderActionButton extends StatelessWidget {
  const HomeHeaderActionButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  final VoidCallback onPressed;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30,
        width: 50,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: ColorName.backgroundPrimary,
          borderRadius: ProjectRadius.small.radius(context),
        ),
        child: Center(
          child: icon.svg(
            package: 'gen',
          ),
        ),
      ),
    );
  }
}
