import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/utility/constants/decoration/index.dart';
import 'package:movitty/product/utility/extension/list_extension.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';

class HomeHeaders extends StatelessWidget {
  const HomeHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeViewModel, HomeState, Header>(
      selector: (state) {
        print('[SELECTOR] header: ${state.header?.items?.length}');
        return state.header ?? Header(items: const []);
      },
      builder: (context, header) {
        if (header.items.isNullOrEmpty) {
          return const CircularProgressIndicator.adaptive();
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: ProjectPadding.horizontalMedium(context),
                child: Text(
                  header.title ?? '',
                  style: TextStyles.header3(context),
                ),
              ),
              ProjectSpacer.smallHeight(context),
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  //TODO: make it responsive
                  height: context.general.mediaSize.height * 0.28,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: header.items?.length ?? 0,
                    separatorBuilder: (context, index) => SizedBox(
                      width: ProjectSize.large.responsive(context),
                    ),
                    itemBuilder: (context, index) {
                      final leftMargin = index == 0
                          ? ProjectPadding.horizontalMedium(context).left
                          : 0;
                      final rightMargin = index == header.items!.length - 1
                          ? ProjectPadding.horizontalMedium(context).right
                          : 0;
                      final margin = EdgeInsets.only(
                        left: leftMargin.ceilToDouble(),
                        right: rightMargin.ceilToDouble(),
                      );
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
                                        header.items![index].image ?? '',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /* child: Image.network(
                                    header.items![index].image ?? '',
                                    fit: BoxFit.cover,
                                  ), */
                                ),
                              ),
                              Flexible(
                                flex: 7,
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left:
                                        ProjectPadding.allMedium(context).left,
                                    top: ProjectPadding.allMedium(context).top,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        header.items![index].title ?? '',
                                        style: TextStyles.subtitle1(
                                          context,
                                          color: ColorName.primary3,
                                        ),
                                      ),
                                      ProjectSpacer.smallHeight(context),
                                      Expanded(
                                        child: Text(
                                          header.items![index].overview ?? '',
                                          overflow: TextOverflow.fade,
                                          style: TextStyles.body(
                                            context,
                                            color: ColorName.primary2,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            context.general.mediaSize.height *
                                                0.055,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 50,
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color:
                                                    ColorName.backgroundPrimary,
                                                borderRadius: ProjectRadius
                                                    .small
                                                    .radius(context),
                                              ),
                                              child: Center(
                                                child:
                                                    Assets.icons.heartPlus.svg(
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
                                                color:
                                                    ColorName.backgroundPrimary,
                                                borderRadius: ProjectRadius
                                                    .small
                                                    .radius(context),
                                              ),
                                              child: Center(
                                                child:
                                                    Assets.icons.addCircle.svg(
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
                    },
                  ),
                ),
              ),
            ],
          );
          /* SizedBox(
            height: ProjectSize.large.responsive(context),
            width: double.infinity,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: ProjectSize.large.responsive(context),
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productions.length,
              itemBuilder: (context, index) {
                return Text(
                  productions[index].title ?? '',
                  style: TextStyles.body(context),
                );
              },
            ),
          ); */
        }
      },
    );
  }
}
