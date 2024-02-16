import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:gen/gen.dart';
import 'package:movitty/product/utility/constants/index.dart';
import 'package:movitty/product/widget/bottomsheet/production_actions_bottomsheet.dart';
import 'package:widgets/widgets.dart';

/// A card widget that displays information about a production in the home
/// section.
///
/// This widget is used to display details about a production, such as a movie
/// or TV show, in the home section of the app. It takes a [Production] object
/// and an [EdgeInsetsGeometry] for the margin as required parameters.
class SectionProdCard extends StatelessWidget {
  /// A card widget that displays information about a production in the home
  /// section.
  const SectionProdCard({
    required this.production,
    required this.margin,
    required this.cardHeight,
    super.key,
  });

  /// Production of the card.
  final Production production;

  /// Margin of the card.
  final EdgeInsetsGeometry margin;

  /// Height of the card.
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        //TODO: Navigate to production details page.
      },
      child: GestureDetector(
        onLongPress: () async {
          final opsBottomsheet = TestProductionActionsBottomsheet(
            title: 'title',
            production: production,
            actions: [
              ProductionAction(
                onAction: () {},
                title: 'Daha Sonra İzle',
                icon: Assets.icons.alarm.svg(package: 'gen'),
              ),
              ProductionAction(
                onAction: () {},
                title: 'Listene Ekle',
                icon: Assets.icons.addCircle.svg(package: 'gen'),
              ),
            ],
            titleStyle: TextStyles.header2(context),
            bodyStyle: TextStyles.body(context),
          );
          await opsBottomsheet.show(context: context, isFixed: false);
        },
        child: Container(
          margin: margin,
          width: cardHeight * 0.65,
          decoration: BoxDecoration(
            borderRadius: ProjectRadius.small.radius(context),
            color: ColorName.backgroundPrimary,
          ),
          child: ClipRRect(
            borderRadius: ProjectRadius.small.radius(context),
            child: CustomNetworkImage(
              imageUrl: production.image ?? '',
              size: Size(
                cardHeight * 0.65,
                cardHeight,
              ),
              memCache: CustomMemCache(
                height: cardHeight.toInt(),
                width: (cardHeight * 0.65).toInt(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
