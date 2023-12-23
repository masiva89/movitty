import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/utility/constants/index.dart';

class HomeSections extends StatelessWidget {
  const HomeSections({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeViewModel, HomeState, List<Section>>(
      selector: (state) {
        print('[SELECTOR] header: ${state.sections?.sections?.length}');
        return state.sections?.sections ?? [];
      },
      builder: (context, sections) {
        if (sections.isEmpty) {
          return const CircularProgressIndicator.adaptive();
        } else {
          return Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: sections.length,
              itemBuilder: (context, index) {
                return Text(
                  sections[index].title ?? '',
                  style: TextStyles.body(context),
                );
              },
            ),
          );
        }
      },
    );
  }
}
