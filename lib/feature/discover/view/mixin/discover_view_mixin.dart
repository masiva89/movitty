import 'package:flutter/material.dart';
import 'package:movitty/feature/discover/view_model/discover_view_model.dart';
import 'package:movitty/product/service/features/discover/discover_service.dart';
import 'package:movitty/product/service/index.dart';
import 'package:movitty/product/state/index.dart';

mixin DiscoverViewMixin on StatelessWidget {
  late final DiscoverViewModel _discoverViewModel;
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  DiscoverViewModel get discoverViewModel => _discoverViewModel;

  DiscoverViewModel discoverViewModelBuilder(BuildContext context) {
    _productNetworkErrorManager = ProductNetworkErrorManager(
      context: context,
      productCache: ProductStateItems.productCache,
    );
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );

    _discoverViewModel = DiscoverViewModel.initial(
      discoverOperation: DiscoverService(
        ProductStateItems.productNetworkManager,
      ),
    );
    return _discoverViewModel;
  }
}
