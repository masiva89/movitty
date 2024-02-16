import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:movitty/product/utility/constants/index.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';
import 'package:movitty/product/widget/pord_section/section_prod_list.dart';
import 'package:movitty/product/widget/pord_section/section_title.dart';

class ProdSection extends StatelessWidget {
  const ProdSection({required this.sections, super.key});

  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ProjectPadding.verticalMedium(context),
      decoration: const BoxDecoration(
        color: ColorName.backgroundSecondary,
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: sections.length,
        separatorBuilder: (context, index) => ProjectSpacer.largeHeight(
          context,
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: sections[index].title),
              ProjectSpacer.smallHeight(context),
              SectionProdList(
                productions: sections[index].productions ?? [],
              ),
            ],
          );
        },
      ),
    );
  }
}
