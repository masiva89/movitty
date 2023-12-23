import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:movitty/feature/home/view_model/cubit/home_cubit.dart';
import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/service/index.dart';
import 'package:movitty/product/service/interface/home_operation.dart';
import 'package:movitty/product/utility/process/multiple_task_processor.dart';

/// Manage your home view business logic
class HomeViewModel extends HomeCubit with HomeViewModelMixin {
  /// [AuthenticationOperation] service
  HomeViewModel({required HomeOperation homeOperation})
      : _homeOperation = homeOperation,
        super(const HomeState(isLoading: false));

  final HomeOperation _homeOperation;

  @override
  Future<void> fetchHomeData() async {
    try {
      final multiple2TaskResult =
          await Multiple2TaskProcessor.run<Header, HomeSections>(
        firstTask: _homeHeader,
        secondTask: _homeSections,
      );
      emit(
        state.copyWith(
          header: multiple2TaskResult.firstTaskResult,
          sections: multiple2TaskResult.secondTaskResult,
        ),
      );
    } on Exception catch (e) {
      CustomLogger.showError<Exception>(e);
    }
  }

  Future<Header> _homeHeader() async => _homeOperation.homeHeader();

  Future<HomeSections> _homeSections() async => _homeOperation.homeSections();
}

  /* Future<HomeSections> _homeSections() async {
    print('service method - _homeSections-------------------');
    try {
      emit(state.copyWith(sections: await _homeOperation.homeSections()));
    } on Exception {
      rethrow;
    }
    print('service method - _homeSections---------------');
  } */

