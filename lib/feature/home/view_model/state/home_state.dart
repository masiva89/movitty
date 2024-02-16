import 'package:gen/gen.dart';
import 'package:movitty/product/state/base/base_equatable.dart';

/// Represents the state of the home screen.
///
/// This class contains information about whether the screen is currently loading,
/// the header of the screen, and the sections displayed on the screen.
final class HomeState extends StateEquatable {
  /// Creates a new [HomeState] instance.
  ///
  /// The [header] and [sections] parameters are optional.
  HomeState({
    this.header,
    this.sections,
    super.status = StateType.LOADING,
  });

  @override
  StateType get status => StateType.LOADING;
  @override
  set status(StateType status) {
    this.status = status;
  }

  /// The header of the screen.
  final Header? header;

  /// The sections displayed on the screen.
  final HomeSections? sections;

  @override
  List<Object?> get props => [status, header, sections];

  /// Creates a copy of this [HomeState] with the specified parameters
  /// overridden.
  HomeState copyWith({
    StateType? status,
    Header? header,
    HomeSections? sections,
  }) {
    if (status == null) {
      if (sections != null) {
        status = StateType.SUCCESS;
      }
    }
    return HomeState(
      header: header ?? this.header,
      sections: sections ?? this.sections,
    );
  }
}
