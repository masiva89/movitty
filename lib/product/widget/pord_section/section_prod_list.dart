import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/product/utility/constants/index.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';
import 'package:movitty/product/widget/pord_section/section_prod_card.dart';

/// A widget that represents the production list for the home screen.
class SectionProdList extends StatelessWidget {
  /// A widget that represents the production list for the home screen.
  const SectionProdList({required this.productions, super.key});

  /// List of productions.
  final List<Production> productions;

  @override
  Widget build(BuildContext context) {
    print('SectionProdList: ${productions.length}');
    return Flexible(
      child: SizedBox(
        width: double.infinity,
        height: context.general.mediaSize.height * 0.18,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: productions.length,
          separatorBuilder: (context, index) => SizedBox(
            width: ProjectSize.xsmall.responsive(context),
          ),
          itemBuilder: (context, index) {
            final leftMargin =
                index == 0 ? ProjectPadding.horizontalMedium(context).left : 0;
            final rightMargin = index == productions.length - 1
                ? ProjectPadding.horizontalMedium(context).right
                : 0;
            final margin = EdgeInsets.only(
              left: leftMargin.ceilToDouble(),
              right: rightMargin.ceilToDouble(),
            );
            return SectionProdCard(
              production: productions[index],
              margin: margin,
              cardHeight: context.general.mediaSize.height * 0.18,
            );
          },
        ),
      ),
    );
  }
}
