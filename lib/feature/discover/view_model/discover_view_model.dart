import 'package:flutter/widgets.dart';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:movitty/feature/discover/view_model/cubit/discover_cubit.dart';
import 'package:movitty/feature/discover/view_model/mixin/discover_view_model_mixin.dart';
import 'package:movitty/feature/discover/view_model/state/discover_state.dart';
import 'package:movitty/product/cache/mixin/auth_cache_mixin.dart';
import 'package:movitty/product/service/interface/discover_operation.dart';

class DiscoverViewModel extends DiscoverCubit
    with AuthCacheCubitMixin, DiscoverViewModelMixin {
  DiscoverViewModel({required DiscoverOperation discoverOperation})
      : _discoverOperation = discoverOperation,
        super(DiscoverState.createState());
  DiscoverViewModel.initial({required DiscoverOperation discoverOperation})
      : _discoverOperation = discoverOperation,
        super(DiscoverState.createState()) {
    initialEvent(null);
  }

  late final DiscoverOperation _discoverOperation;

  @override
  void initialEvent(BuildContext? context) {
    fetchDiscoverData();
  }

  @override
  Future<void> fetchDiscoverData() async {
    DiscoverSections? response;
    try {
      await Future.delayed(const Duration(seconds: 2));
      response = await _discoverSections();
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      changeState();
    }
  }

  Future<void> test() async {
    changeLoading();
    await Future.delayed(const Duration(seconds: 10));
    changeLoading();
  }

  Future<DiscoverSections> _discoverSections() async =>
      _discoverOperation.discoverSections();
}
