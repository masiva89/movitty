import 'package:flutter/material.dart';
import 'package:movitty/product/utility/constants/decoration/project_radius.dart';
import 'package:movitty/product/utility/constants/decoration/text_styles.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';

/// CustomTextButton
class CustomTextButton extends StatelessWidget {
  /// constructor
  const CustomTextButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  /// title text
  final String title;

  /// button on pressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: ProjectPadding.allXSmall(context),
        shape: RoundedRectangleBorder(
          borderRadius: ProjectRadius.small.radius(context),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyles.textButton(context),
      ),
    );
  }
}
