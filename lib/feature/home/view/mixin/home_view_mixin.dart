import 'package:movitty/feature/home/view/home_view.dart';
import 'package:movitty/feature/home/view_model/home_view_model.dart';
import 'package:movitty/product/service/features/auth/login_service.dart';
import 'package:movitty/product/service/manager/product_network_error_manager.dart';
import 'package:movitty/product/state/base/base_state.dart';
import 'package:movitty/product/state/container/product_state_items.dart';

/// Manage your home view business logic
mixin HomeViewMixin on BaseState<HomeView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;

  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(
      context: context,
      productCache: ProductStateItems.productCache,
    );
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );

    _homeViewModel = HomeViewModel(
      operationService: LoginService(productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
    );
  }
}
