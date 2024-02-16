import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:movitty/feature/discover/view/mixin/discover_view_mixin.dart';
import 'package:movitty/feature/discover/view_model/discover_view_model.dart';
import 'package:movitty/feature/discover/view_model/state/discover_state.dart';
import 'package:movitty/product/state/base/base_view.dart';
import 'package:movitty/product/utility/constants/decoration/index.dart';
import 'package:movitty/product/widget/loading/custom_loading.dart';

/* class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends BaseState<DiscoverView>
    with DiscoverViewMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      vm: discoverViewModel,
      builder: (context) {
        Logger().i('DiscoverView: BaseView.builder');
        return const SizedBox.shrink();
      },
    );
  }
} */

@RoutePage()
class DiscoverView extends StatelessWidget with DiscoverViewMixin {
  DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<DiscoverViewModel, DiscoverState>(
      authGuardEnabled: true,
      vmBuilder: discoverViewModelBuilder,
      builder: (context, vm, state) {
        Logger().i('DiscoverView: BaseView.builder');
        Logger().i('DiscoverView: STATE: ${state.status}');
        return Column(
          children: [
            Text(
              'DiscoverView status: ${state.status}',
              style: TextStyles.body(context),
            ),
            ElevatedButton(
              onPressed: () {
                vm.test();
              },
              child: const Text('Fetch Discover Data'),
            ),
            ProjectSpacer.xLargeHeight(context),
            const CustomLoading(),
          ],
        );
      },
    );
  }
}
