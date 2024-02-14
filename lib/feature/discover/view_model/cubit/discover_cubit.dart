import 'package:movitty/feature/discover/view_model/state/discover_state.dart';
import 'package:movitty/product/state/index.dart';

abstract class DiscoverCubit extends BaseCubit<DiscoverState> {
  /// Creates a new [DiscoverCubit] instance.
  ///
  /// The [initialState] parameter is required.
  DiscoverCubit(super.initialState);

  /// Fetches the discover data asynchronously.
  ///
  /// This method is used to fetch the necessary data for the discover screen.
  /// It returns a [Future] that completes when the data fetching is finished.
  Future<void> fetchDiscoverData();
}
