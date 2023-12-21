import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/core/production.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'list.g.dart';

@JsonSerializable()
@immutable

/// Represents a Movitty list.
///
/// This class is used to model a list in the Movitty application.
/// It contains properties such as [title], [description], and [items].
/// The [title] represents the title of the list, [description] represents
/// the description of the list, and [items] represents the list of productions
/// included in the list.
///
/// This class implements the [INetworkModel] interface and uses the
/// [EquatableMixin] for equality comparison.
class MovittyList extends INetworkModel<MovittyList> with EquatableMixin {
  /// Creates a new instance of [MovittyList].
  ///
  /// * The [title] represents the title of the list.
  /// * The [description] represents the description of the list.
  /// * The [items] represents the list of productions included in the list.
  MovittyList({
    this.title,
    this.description,
    this.items,
  });

  /// Creates a new instance of [MovittyList] from a JSON map.
  ///
  /// The [json] parameter represents the JSON map to convert.
  factory MovittyList.fromJson(Map<String, dynamic> json) =>
      _$MovittyListFromJson(json);

  /// The title of the list.
  final String? title;

  /// The description of the list.
  final String? description;

  /// The list of productions included in the list.
  final List<Production>? items;

  @override
  MovittyList fromJson(Map<String, dynamic> json) {
    return _$MovittyListFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$MovittyListToJson(this);

  @override
  List<Object?> get props => [title, description, items];

  /// Creates a copy of the [MovittyList] instance with the specified
  /// properties.
  ///
  /// * The [title] parameter represents the new title of the list.
  /// * The [description] parameter represents the new description of the list.
  /// * The [items] parameter represents the new list of productions included
  /// * in the list.
  MovittyList copyWith({
    String? title,
    String? description,
    List<Production>? items,
  }) {
    return MovittyList(
      title: title ?? this.title,
      description: description ?? this.description,
      items: items ?? this.items,
    );
  }
}
