import 'package:flutter/material.dart';
import 'package:movitty/feature/home/view/home_view.dart';
import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/service/features/home/home_service.dart';
import 'package:movitty/product/service/index.dart';
import 'package:movitty/product/state/index.dart';

/// Manage your home view business logic
mixin HomeViewMixin on BaseState<HomeView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final HomeViewModel _homeViewModel;

  /// Returns the [HomeViewModel] instance associated with the home view mixin.
  ///
  /// This getter provides access to the [HomeViewModel] instance used in the
  /// home view mixin. It allows other classes to retrieve and utilize the
  /// [HomeViewModel] instance for various operations.
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
      homeOperation: HomeService(ProductStateItems.productNetworkManager),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeViewModel.fetchHomeData();
    });
  }
}
