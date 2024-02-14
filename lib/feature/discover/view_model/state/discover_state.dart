import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

/// Represents the state of the discover screen.
///
/// This class contains information about whether the screen is currently
/// loading and the sections displayed on the screen.
final class DiscoverState extends Equatable {
  /// Creates a new [DiscoverState] instance.
  ///
  /// The [isLoading] parameter is optional defaults to 'true', while the [sections] parameter is
  /// required.
  const DiscoverState({this.isLoading = true, this.sections});

  /// Whether the screen is currently loading.
  final bool isLoading;

  /// The sections displayed on the screen.
  final DiscoverSections? sections;

  @override
  List<Object?> get props => [isLoading, sections];

  /// Creates a copy of this [DiscoverState] with the specified parameters
  /// overridden.
  DiscoverState copyWith({
    bool? isLoading,
    DiscoverSections? sections,
  }) {
    return DiscoverState(
      isLoading: isLoading ?? this.isLoading,
      sections: sections ?? this.sections,
    );
  }
}
