// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/core/production.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list.g.dart';

@JsonSerializable()
@immutable
final class MovittyList with EquatableMixin {
  const MovittyList({
    this.title,
    this.description,
    this.items,
  });

  factory MovittyList.fromJson(Map<String, dynamic> json) =>
      _$MovittyListFromJson(json);

  final String? title;
  final String? description;
  final List<Production>? items;

  Map<String, dynamic> toJson() => _$MovittyListToJson(this);

  @override
  List<Object?> get props => [title, description, items];

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
