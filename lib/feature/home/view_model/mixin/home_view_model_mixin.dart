import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/state/base/base_cubit.dart';

/// A mixin that provides additional functionality to the [HomeViewModel] class.
/// It is used in conjunction with the [BaseCubit] class to handle the state of
/// the home screen.
mixin HomeViewModelMixin on BaseCubit<HomeState> {
  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
