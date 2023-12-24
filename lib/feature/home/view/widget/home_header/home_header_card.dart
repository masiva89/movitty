import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/product/utility/constants/index.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';

/// A widget that represents the headers for the home screen.
class HomeHeaderCard extends StatelessWidget {
  /// A widget that represents the headers for the home screen.
  const HomeHeaderCard({
    required this.margin,
    required this.production,
    super.key,
  });

  /// Margin of the card.
  final EdgeInsetsGeometry margin;

  /// Production of the card.
  final Production production;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: context.general.mediaSize.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: ProjectRadius.large.radius(context),
        color: ColorName.backgroundSecondary,
      ),
      child: ClipRRect(
        borderRadius: ProjectRadius.large.radius(context),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorName.primary.withOpacity(0),
                      ColorName.primary.withOpacity(0.5),
                      ColorName.primary.withOpacity(0.8),
                      ColorName.primary.withOpacity(1),
                    ],
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      production.image ?? '',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 7,
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.only(
                  left: ProjectPadding.allMedium(context).left,
                  top: ProjectPadding.allMedium(context).top,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      production.title ?? '',
                      style: TextStyles.subtitle1(
                        context,
                        color: ColorName.primary3,
                      ),
                    ),
                    ProjectSpacer.smallHeight(context),
                    Expanded(
                      child: Text(
                        production.overview ?? '',
                        overflow: TextOverflow.fade,
                        style: TextStyles.body(
                          context,
                          color: ColorName.primary2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.general.mediaSize.height * 0.055,
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 50,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: ColorName.backgroundPrimary,
                              borderRadius: ProjectRadius.small.radius(context),
                            ),
                            child: Center(
                              child: Assets.icons.heartPlus.svg(
                                package: 'gen',
                              ),
                            ),
                          ),
                          ProjectSpacer.largeWidth(context),
                          Container(
                            height: 30,
                            width: 50,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: ColorName.backgroundPrimary,
                              borderRadius: ProjectRadius.small.radius(context),
                            ),
                            child: Center(
                              child: Assets.icons.addCircle.svg(
                                package: 'gen',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
