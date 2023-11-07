// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/core/production.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section.g.dart';

@JsonSerializable()
@immutable
final class Section with EquatableMixin {
  const Section({
    this.title,
    this.production_type_id,
    this.productions,
  });

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
  final String? title;
  final int? production_type_id;
  final List<Production>? productions;

  /// The function converts an object of type Section to a JSON map.
  Map<String, dynamic> toJson() => _$SectionToJson(this);

  @override
  List<Object?> get props => [title, production_type_id, productions];

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
