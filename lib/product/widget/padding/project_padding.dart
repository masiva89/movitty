import 'package:flutter/material.dart';
import 'package:movitty/product/utility/constants/decoration/extension/responsive_ext.dart';

/// Project general padding items
final class ProjectPadding extends EdgeInsets {
  const ProjectPadding._() : super.all(0);

  /// [ProjectPadding.allXSmall] is 4
  ProjectPadding.allXSmall(BuildContext context)
      : super.all(4.responsivePadding(context));

  /// [ProjectPadding.allSmall] is 6
  ProjectPadding.allSmall(BuildContext context)
      : super.all(6.responsivePadding(context));

  /// [ProjectPadding.allMedium] is 8
  ProjectPadding.allMedium(BuildContext context)
      : super.all(8.responsivePadding(context));

  /// [ProjectPadding.allLarge] is 12
  ProjectPadding.allLarge(BuildContext context)
      : super.all(12.responsivePadding(context));

  /// [ProjectPadding.allXLarge] is 16
  ProjectPadding.allXLarge(BuildContext context)
      : super.all(16.responsivePadding(context));

  /// [ProjectPadding.horizontalXSmall] is 20
  ProjectPadding.horizontalXSmall(BuildContext context)
      : super.symmetric(horizontal: 4.responsivePadding(context));

  /// [ProjectPadding.horizontalSmall] is 6
  ProjectPadding.horizontalSmall(BuildContext context)
      : super.symmetric(horizontal: 6.responsivePadding(context));

  /// [ProjectPadding.horizontalMedium] is 8
  ProjectPadding.horizontalMedium(BuildContext context)
      : super.symmetric(horizontal: 8.responsivePadding(context));

  /// [ProjectPadding.horizontalLarge] is 12
  ProjectPadding.horizontalLarge(BuildContext context)
      : super.symmetric(horizontal: 12.responsivePadding(context));

  /// [ProjectPadding.horizontalXLarge] is 16
  ProjectPadding.horizontalXLarge(BuildContext context)
      : super.symmetric(horizontal: 16.responsivePadding(context));

  /// [ProjectPadding.verticalXSmall] is 4
  ProjectPadding.verticalXSmall(BuildContext context)
      : super.symmetric(vertical: 4.responsivePadding(context));

  /// [ProjectPadding.verticalSmall] is 6
  ProjectPadding.verticalSmall(BuildContext context)
      : super.symmetric(vertical: 6.responsivePadding(context));

  /// [ProjectPadding.verticalMedium] is 8
  ProjectPadding.verticalMedium(BuildContext context)
      : super.symmetric(vertical: 8.responsivePadding(context));

  /// [ProjectPadding.verticalLarge] is 12
  ProjectPadding.verticalLarge(BuildContext context)
      : super.symmetric(vertical: 12.responsivePadding(context));

  /// [ProjectPadding.verticalXLarge] is 16
  ProjectPadding.verticalXLarge(BuildContext context)
      : super.symmetric(vertical: 16.responsivePadding(context));
}
