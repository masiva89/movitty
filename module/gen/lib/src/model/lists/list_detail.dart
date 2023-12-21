// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'list_detail.g.dart';

@JsonSerializable()
@immutable

/// Represents the detailed information of a production list.
class ProductionListDetail extends INetworkModel<ProductionListDetail>
    with EquatableMixin {
  /// Constructs a [ProductionListDetail] object.
  ///
  /// * [list_id] - The ID of the list.
  /// * [list_type_id] - The ID of the list type.
  /// * [name] - The name of the list.
  /// * [isOwner] - Indicates whether the user is the owner of the list.
  /// * [share_info] - The share information of the list.
  /// * [items] - The list of productions in the list.
  ProductionListDetail({
    this.list_id,
    this.list_type_id,
    this.name,
    this.isOwner,
    this.share_info,
    this.items,
  });

  /// Constructs a [ProductionListDetail] object from a JSON map.
  ///
  /// [json] - The JSON map representing the [ProductionListDetail] object.
  factory ProductionListDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductionListDetailFromJson(json);

  /// The ID of the list.
  final int? list_id;

  /// The ID of the list type.
  final int? list_type_id;

  /// The name of the list.
  final String? name;

  /// Indicates whether the user is the owner of the list.
  final bool? isOwner;

  /// The share information of the list.
  final ShareInfo? share_info;

  /// The list of productions in the list.
  final List<Production>? items;

  @override
  ProductionListDetail fromJson(Map<String, dynamic> json) {
    return _$ProductionListDetailFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$ProductionListDetailToJson(this);

  @override
  List<Object?> get props =>
      [list_id, list_type_id, name, isOwner, share_info, items];

  /// Creates a copy of the [ProductionListDetail] object with the specified 
  /// fields replaced.
  ///
  /// [list_id] - The ID of the list.
  /// [list_type_id] - The ID of the list type.
  /// [name] - The name of the list.
  /// [isOwner] - Indicates whether the user is the owner of the list.
  /// [share_info] - The share information of the list.
  /// [items] - The list of productions in the list.
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
