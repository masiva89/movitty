import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/core/section/section.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'home_sections.g.dart';

@JsonSerializable()
@immutable

/// Represents the sections of the home page in the Movitty application.
///
/// Each section contains a list of [Section] objects.
class HomeSections extends INetworkModel<HomeSections> with EquatableMixin {
  /// Creates a new instance of [HomeSections].
  ///
  /// * [sections] is the list of sections in the home page.
  HomeSections({this.sections});

  factory HomeSections.fromJson(Map<String, dynamic> json) =>
      _$HomeSectionsFromJson(json);

  /// Creates a new instance of [HomeSections] from a JSON map.
  final List<Section>? sections;

  @override
  HomeSections fromJson(Map<String, dynamic> json) {
    return _$HomeSectionsFromJson(json);
  }

  @override
  List<Object?> get props => [sections];

  @override
  Map<String, dynamic>? toJson() {
    return _$HomeSectionsToJson(this);
  }

  /// Creates a copy of this [HomeSections] object with the given fields
  /// replaced with the new values.
  HomeSections copyWith({
    List<Section>? sections,
  }) {
    return HomeSections(
      sections: sections ?? this.sections,
    );
  }
}
