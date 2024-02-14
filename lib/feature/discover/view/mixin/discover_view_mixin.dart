import 'package:movitty/feature/home/view/home_view.dart';
import 'package:movitty/product/service/index.dart';
import 'package:movitty/product/state/base/base_state.dart';

mixin DiscoverViewMixin on BaseState<HomeView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
}
