// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';
import 'package:gen/src/model/lists/share/share_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_detail.g.dart';

@JsonSerializable()
@immutable
final class ProductionListDetail with EquatableMixin {
  const ProductionListDetail({
    this.list_id,
    this.list_type_id,
    this.name,
    this.isOwner,
    this.share_info,
    this.items,
  });

  factory ProductionListDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductionListDetailFromJson(json);

  final int? list_id;
  final int? list_type_id;
  final String? name;
  final bool? isOwner;
  final ShareInfo? share_info;
  final List<Production>? items;

  Map<String, dynamic> toJson() => _$ProductionListDetailToJson(this);

  @override
  List<Object?> get props =>
      [list_id, list_type_id, name, isOwner, share_info, items];

  ProductionListDetail copyWith({
    int? list_id,
    int? list_type_id,
    String? name,
    bool? isOwner,
    ShareInfo? share_info,
    List<Production>? items,
  }) {
    return ProductionListDetail(
      list_id: list_id ?? this.list_id,
      list_type_id: list_type_id ?? this.list_type_id,
      name: name ?? this.name,
      isOwner: isOwner ?? this.isOwner,
      share_info: share_info ?? this.share_info,
      items: items ?? this.items,
    );
  }
}
