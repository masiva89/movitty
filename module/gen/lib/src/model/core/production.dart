// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production.g.dart';

@JsonSerializable()
@immutable
final class Production with EquatableMixin {
  const Production({
    this.id,
    this.title,
    this.image,
    this.overview,
    this.isLiked,
    this.production_type_id,
  });

  factory Production.fromJson(Map<String, dynamic> json) =>
      _$ProductionFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionToJson(this);

  final int? id;
  final int? production_type_id;
  final String? title;
  final String? image;
  final String? overview;
  final bool? isLiked;

  @override
  List<Object?> get props =>
      [id, title, image, overview, isLiked, production_type_id];

  Production copyWith({
    int? id,
    String? title,
    String? image,
    String? overview,
    bool? isLiked,
    int? production_type_id,
  }) {
    return Production(
      id: id ?? this.id,
      production_type_id: production_type_id ?? this.production_type_id,
      title: title ?? this.title,
      image: image ?? this.image,
      overview: overview ?? this.overview,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
