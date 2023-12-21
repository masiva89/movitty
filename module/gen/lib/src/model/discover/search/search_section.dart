// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/core/production.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'search_section.g.dart';

@JsonSerializable()
@immutable

/// Represents a section in the search results.
///
/// This class is responsible for storing information about a search section,
/// including its title, search type ID, and a list of productions. It
/// implements the `INetworkModel` interface and the `EquatableMixin` mixin.
///
/// The `SearchSection` class provides methods for converting an object of type
/// `SearchSection` to a JSON map and for creating a copy of a `SearchSection`
/// object with optional modifications.
class SearchSection extends INetworkModel<SearchSection> with EquatableMixin {
  /// Creates a new instance of the `SearchSection` class.
  ///
  /// The `title` parameter represents the title of the search section.
  /// The `search_type_id` parameter represents the ID of the search type.
  /// The `items` parameter represents the list of productions in the search
  /// section.
  SearchSection({
    this.title,
    this.search_type_id,
    this.items,
  });

  /// Creates a new instance of the `SearchSection` class from a JSON map.
  ///
  /// The `json` parameter represents the JSON map to convert.
  factory SearchSection.fromJson(Map<String, dynamic> json) =>
      _$SearchSectionFromJson(json);

  /// The title of the search section.
  final String? title;

  /// The ID of the search type.
  final int? search_type_id;

  /// The list of productions in the search section.
  final List<Production>? items;

  @override
  SearchSection fromJson(Map<String, dynamic> json) {
    return _$SearchSectionFromJson(json);
  }

  /// Converts the `SearchSection` object to a JSON map.
  @override
  Map<String, dynamic> toJson() => _$SearchSectionToJson(this);

  @override
  List<Object?> get props => [title, search_type_id, items];

  /// Creates a copy of the `SearchSection` object with optional modifications.
  ///
  /// The `title` parameter represents the new title of the search section.
  /// The `search_type_id` parameter represents the new ID of the search type.
  /// The `items` parameter represents the new list of productions in the search
  /// section.
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
