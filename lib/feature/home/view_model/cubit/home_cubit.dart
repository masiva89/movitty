import 'package:movitty/feature/home/view_model/index.dart';
import 'package:movitty/product/state/index.dart';

/// A cubit that manages the state of the home screen.
///
/// This cubit extends the [BaseCubit] class and provides methods to fetch home
/// data.
abstract class HomeCubit extends BaseCubit<HomeState> {
  /// Creates a new [HomeCubit] instance.
  ///
  /// The [initialState] parameter is required.
  HomeCubit(super.initialState);

  /// Fetches the home data asynchronously.
  ///
  /// This method is used to fetch the necessary data for the home screen.
  /// It returns a [Future] that completes when the data fetching is finished.
  Future<void> fetchHomeData();
}
