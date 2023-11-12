import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/product/utility/constants/decoration/project_radius.dart';
import 'package:movitty/product/utility/constants/decoration/text_styles.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';

/// radius is 20
final class NormalButton extends StatelessWidget {
  /// constructor
  const NormalButton({
    required this.title,
    required this.onPressed,
    super.key,
    this.isPrimary = true,
  });

  /// title text
  final String title;

  /// button on pressed
  final VoidCallback onPressed;

  /// is primary
  ///
  /// default is true.
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      radius: ProjectRadius.large.responsive(context),
      borderRadius: ProjectRadius.large.radius(context),
      child: Ink(
        width: double.infinity,
        padding: ProjectPadding.allLarge(context),
        decoration: BoxDecoration(
          color: isPrimary ? ColorName.primary : ColorName.backgroundSecondary,
          border: Border.all(
            color: ColorName.primary,
          ),
          borderRadius: ProjectRadius.large.radius(context),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.button(context),
          ),
        ),
      ),
    );
  }
}
