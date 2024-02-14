import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:movitty/feature/home/view/widget/home_sections/home_sections_no_auth.dart';
import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/navigation/guard/enum/user_status.dart';
import 'package:movitty/product/utility/extension/list_extension.dart';
import 'package:movitty/product/widget/pord_section/prod_section.dart';

/// A widget that represents the sections on the home screen.
class HomeSections extends StatelessWidget {
  /// A widget that represents the sections on the home screen.
  const HomeSections({required this.homeViewModel, super.key});

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeViewModel, HomeState, List<Section>>(
      selector: (state) {
        print('[SELECTOR] sections: ${state.sections?.sections?.length}');
        return state.sections?.sections ?? [];
      },
      builder: (context, sections) {
        switch (homeViewModel.userAuthStatus) {
          case UserStatus.notVerified:
            return const SizedBox.shrink();
          case UserStatus.notLoggedIn:
            return const HomeSectionNoAuth();
          case UserStatus.loggedIn:
            if (sections.isNullOrEmpty) {
              return const CircularProgressIndicator.adaptive();
            } else {
              return ProdSection(sections: sections);
            }
        }
      },
    );
  }
}
