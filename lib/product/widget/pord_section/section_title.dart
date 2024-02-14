import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/product/utility/constants/index.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';

/// A widget that represents the titles for the sections.
class SectionTitle extends StatelessWidget {
  /// A widget that represents the titles for the sections.
  const SectionTitle({required this.title, super.key, this.titleColor});

  /// Title of the section.
  final String? title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding.horizontalMedium(context),
      child: Text(
        title ?? '',
        style: TextStyles.header3(
          context,
          color: titleColor ?? ColorName.primary4,
        ),
      ),
    );
  }
}
