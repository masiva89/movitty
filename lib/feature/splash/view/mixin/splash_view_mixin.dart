import 'package:movitty/feature/splash/view/splash_view.dart';
import 'package:movitty/feature/splash/view_model/splash_view_model.dart';
import 'package:movitty/product/service/index.dart';
import 'package:movitty/product/state/index.dart';

/// A mixin that provides functionality for the splash view in the Movitty app.
/// This mixin is intended to be used with the `BaseState` class.
mixin SplashViewMixin on BaseState<SplashView> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  late final SplashViewModel _splashViewModel;

  /// Gets the instance of the [SplashViewModel] associated with this mixin.
  SplashViewModel get splashViewModel => _splashViewModel;

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

    _splashViewModel = SplashViewModel();
    _splashViewModel.testInit(context);
  }
}
