// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/core/production.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'section.g.dart';

@JsonSerializable()
@immutable

/// Represents a section in the application.
///
/// A section contains information about a specific category or genre of
/// productions. It includes a title, production type ID, and a list of
/// productions.
class Section extends INetworkModel<Section> with EquatableMixin {
  /// Creates a new instance of [Section].
  ///
  /// * [title] is the title of the section.
  /// * [production_type_id] is the production type ID of the section.
  /// * [productions] is the list of productions in the section.
  Section({
    this.title,
    this.production_type_id,
    this.productions,
  });

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  @override
  Section fromJson(Map<String, dynamic> json) {
    return _$SectionFromJson(json);
  }

  /// The title of the section.
  final String? title;

  /// The production type ID of the section.
  final int? production_type_id;

  /// The list of productions in the section.
  final List<Production>? productions;

  @override
  Map<String, dynamic> toJson() => _$SectionToJson(this);

  @override
  List<Object?> get props => [title, production_type_id, productions];

  /// Creates a copy of this section with the specified attributes overridden.
  ///
  /// If any of the attributes are not provided, the corresponding attribute
  /// from the original section is used.
  Section copyWith({
    String? title,
    int? production_type_id,
    List<Production>? productions,
  }) {
    return Section(
      title: title ?? this.title,
      production_type_id: production_type_id ?? this.production_type_id,
      productions: productions ?? this.productions,
    );
  }
}
