// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invitation.g.dart';

@JsonSerializable()
@immutable
final class Invitation with EquatableMixin {
  const Invitation({
    this.id,
    this.from,
    this.list_name,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);

  final int? id;
  final String? from;
  final String? list_name;

  Map<String, dynamic> toJson() => _$InvitationToJson(this);

  @override
  List<Object?> get props => [id, from, list_name];

  Invitation copyWith({
    int? id,
    String? from,
    String? list_name,
  }) {
    return Invitation(
      id: id ?? this.id,
      from: from ?? this.from,
      list_name: list_name ?? this.list_name,
    );
  }
}
