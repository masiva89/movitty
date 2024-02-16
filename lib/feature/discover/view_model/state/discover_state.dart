import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:movitty/product/state/base/base_equatable.dart';

/// Represents the state of the discover screen.
///
/// This class contains information about whether the screen is currently
/// loading and the sections displayed on the screen.
final class DiscoverState extends StateEquatable {
  /// Creates a new [DiscoverState] instance.
  ///
  /// The [sections] parameter is optional.
  DiscoverState({
    this.sections,
    super.status = StateType.LOADING,
    super.isLoading = false,
  });

  DiscoverState.createState({this.sections})
      : super(
          status: StateType.LOADING,
          isLoading: false,
        );

  /*  DiscoverState.createStateWithAuth({required this.userStatus, this.sections})
      : super(
          status: StateType.LOADING,
          isLoading: false,
        ); */

  @override
  set status(StateType status) {
    this.status = status;
  }

  @override
  set isLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  /// The sections displayed on the screen.
  final DiscoverSections? sections;

  //UserStatus? userStatus;

  @override
  List<Object?> get props => [isLoading, status, sections];

  /// Creates a copy of this [DiscoverState] with the specified parameters
  /// overridden.
  DiscoverState copyWith({
    StateType? viewState,
    bool? isLoading,
    DiscoverSections? sections,
    //UserStatus? userStatus,
  }) {
    Logger().i('DiscoverState: isLoading: $isLoading, viewState: $viewState');
    /* if (viewState == null) {
      if (sections != null) {
        viewState = StateType.SUCCESS;
      } else {
        viewState = StateType.ERROR;
      }
    } */
    return DiscoverState(
      //userStatus: userStatus ?? this.userStatus,
      status: viewState ?? status,
      sections: sections ?? this.sections,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
