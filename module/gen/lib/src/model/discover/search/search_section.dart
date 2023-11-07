// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/core/production.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_section.g.dart';

@JsonSerializable()
@immutable
final class SearchSection with EquatableMixin {
  const SearchSection({
    this.title,
    this.search_type_id,
    this.items,
  });

  factory SearchSection.fromJson(Map<String, dynamic> json) =>
      _$SearchSectionFromJson(json);

  final String? title;
  final int? search_type_id;
  final List<Production>? items;

  /// The function converts an object of type Section to a JSON map.
  Map<String, dynamic> toJson() => _$SearchSectionToJson(this);

  @override
  List<Object?> get props => [title, search_type_id, items];

  SearchSection copyWith({
    String? title,
    int? search_type_id,
    List<Production>? items,
  }) {
    return SearchSection(
      title: title ?? this.title,
      search_type_id: search_type_id ?? this.search_type_id,
      items: items ?? this.items,
    );
  }
}
