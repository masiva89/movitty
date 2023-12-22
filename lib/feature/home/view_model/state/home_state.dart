import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

/// Represents the state of the home screen.
///
/// This class contains information about whether the screen is currently loading,
/// the header of the screen, and the sections displayed on the screen.
class HomeState extends Equatable {
  /// Creates a new [HomeState] instance.
  ///
  /// The [isLoading] parameter is required, while the [header] and [sections]
  /// parameters are optional.
  const HomeState({required this.isLoading, this.header, this.sections});

  /// Whether the screen is currently loading.
  final bool isLoading;

  /// The header of the screen.
  final Header? header;

  /// The sections displayed on the screen.
  final HomeSections? sections;

  @override
  List<Object?> get props => [isLoading, header, sections];

  /// Creates a copy of this [HomeState] with the specified parameters
  /// overridden.
  HomeState copyWith({
    bool? isLoading,
    Header? header,
    HomeSections? sections,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      header: header ?? this.header,
      sections: sections ?? this.sections,
    );
  }
}
