import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/product/utility/constants/decoration/enums/font_sizes.dart';

extension FontResponsive on FontSizes {
  double responsive(BuildContext context) => context.sized.height * value / 700;
}

extension PaddingResponsive on num {
  double responsivePadding(BuildContext context) =>
      context.sized.height * this / 700;
}

extension SizeResponsive on num {
  double responsive(BuildContext context) => context.sized.height * this / 700;
}
