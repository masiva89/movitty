import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/feature/home/view/widget/home_header/home_header_action_button.dart';
import 'package:movitty/product/utility/constants/index.dart';
import 'package:movitty/product/utility/guard/auth_op_guard.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';

/// A widget that represents the headers for the home screen.
class HomeHeaderCard2 extends StatelessWidget {
  /// A widget that represents the headers for the home screen.
  const HomeHeaderCard2({
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
                borderRadius: ProjectRadius.medium.radius(context),
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
                        HomeHeaderActionButton(
                          onPressed: () {
                            AuthOpGuard.instance.callGuarded(
                              context,
                              () async => Future.microtask(
                                () => print('Add to watchlist'),
                              ),
                            );
                          },
                          icon: Assets.icons.heartPlus,
                        ),
                        ProjectSpacer.largeWidth(context),
                        HomeHeaderActionButton(
                          onPressed: () async {
                            await AuthOpGuard.instance.callGuarded(
                              context,
                              await Future.delayed(
                                const Duration(seconds: 1),
                              ),
                            );
                          },
                          icon: Assets.icons.addCircle,
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
    );
  }
}
