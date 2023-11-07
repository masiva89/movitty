// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/core/production.dart';
import 'package:json_annotation/json_annotation.dart';

part 'header.g.dart';

@JsonSerializable()
@immutable
final class Header with EquatableMixin {
  const Header({
    this.title,
    this.items,
  });

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  final String? title;
  final List<Production>? items;

  Map<String, dynamic> toJson() => _$HeaderToJson(this);

  @override
  List<Object?> get props => [title, items];

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
