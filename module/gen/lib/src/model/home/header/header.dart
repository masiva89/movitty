import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/core/production.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'header.g.dart';

@JsonSerializable()
@immutable

/// Represents the header of a home section in the Movitty app.
///
/// The header contains a title and a list of productions.
class Header extends INetworkModel<Header> with EquatableMixin {
  /// Constructs a new instance of [Header].
  Header({
    this.title,
    this.items,
  });

  /// Constructs a [Header] object from a JSON map.
  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  /// The title of the header.
  final String? title;

  /// The list of productions in the header.
  final List<Production>? items;

  @override
  Map<String, dynamic> toJson() => _$HeaderToJson(this);

  @override
  Header fromJson(Map<String, dynamic> json) {
    return _$HeaderFromJson(json);
  }

  @override
  List<Object?> get props => [title, items];

  /// Creates a copy of this [Header] object with the given fields replaced
  /// with the new values.
  Header copyWith({
    String? title,
    List<Production>? items,
  }) {
    return Header(
      title: title ?? this.title,
      items: items ?? this.items,
    );
  }
}
