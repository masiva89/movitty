import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:movitty/feature/home/view/widget/home_header/home_header_card2.dart';
import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/utility/constants/decoration/index.dart';
import 'package:movitty/product/utility/extension/list_extension.dart';
import 'package:movitty/product/widget/padding/project_padding.dart';
import 'package:movitty/product/widget/pord_section/section_title.dart';

/// A widget that represents the headers for the home screen.
class HomeHeaders2 extends StatelessWidget {
  /// A widget that represents the headers for the home screen.
  const HomeHeaders2({super.key});

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
              SectionTitle(title: header.title),
              ProjectSpacer.smallHeight(context),
              CarouselSlider.builder(
                itemCount: header.items?.length ?? 0,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIndex) {
                  return HomeHeaderCard2(
                    margin: EdgeInsets.only(
                      left: index == 0
                          ? ProjectPadding.horizontalMedium(context).left
                          : 0,
                      right: index == header.items!.length - 1
                          ? ProjectPadding.horizontalMedium(context).right
                          : 0,
                    ),
                    production: header.items![index],
                  );
                },
              ),
              /* Flexible(
                child: SizedBox(
                  width: double.infinity,
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
                      return HomeHeaderCard(
                        margin: margin,
                        production: header.items![index],
                      );
                    },
                  ),
                ),
              ), */
            ],
          );
        }
      },
    );
  }
}
