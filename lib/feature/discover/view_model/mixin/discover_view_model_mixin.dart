import 'package:movitty/feature/discover/view_model/state/discover_state.dart';
import 'package:movitty/product/state/base/base_equatable.dart';
import 'package:movitty/product/state/index.dart';

mixin DiscoverViewModelMixin on BaseCubit<DiscoverState> {
  /// Change view state
  void changeState() {
    emit(state.copyWith(viewState: state.status.opposite));
  }

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}
