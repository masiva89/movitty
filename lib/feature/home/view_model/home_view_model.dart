import 'package:kartal/kartal.dart';
import 'package:movitty/feature/home/view_model/cubit/home_cubit.dart';
import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/service/index.dart';
import 'package:movitty/product/service/interface/home_operation.dart';

/// Manage your home view business logic
class HomeViewModel extends HomeCubit with HomeViewModelMixin {
  /// [AuthenticationOperation] service
  HomeViewModel({required HomeOperation homeOperation})
      : _homeOperation = homeOperation,
        super(const HomeState(isLoading: false));

  final HomeOperation _homeOperation;

  @override
  Future<void> fetchHomeData() async {
    changeLoading();
    try {
      await Future.wait([
        _homeHeader(),
        _homeSections(),
      ]);
    } on Exception catch (e) {
      CustomLogger.showError<Exception>(e);
    }
    changeLoading();
  }

  Future<void> _homeHeader() async {
    try {
      emit(state.copyWith(header: await _homeOperation.homeHeader()));
    } on Exception {
      rethrow;
    }
  }

  Future<void> _homeSections() async {
    try {
      emit(state.copyWith(sections: await _homeOperation.homeSections()));
    } on Exception {
      rethrow;
    }
  }
}
