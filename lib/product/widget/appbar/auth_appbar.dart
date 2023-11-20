import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/product/utility/constants/decoration/project_size.dart';
import 'package:widgets/widgets.dart';

/// Custom appbar for auth pages
class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Default constructor
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Assets.images.mainLogoSvg.svg(
        package: 'gen',
        height: ProjectSize.xxlarge.responsive(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
