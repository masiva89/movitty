// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'awaiting_invitation.g.dart';

@JsonSerializable()
@immutable
final class AwaitingInvitation with EquatableMixin {
  const AwaitingInvitation({
    this.invitation_id,
    this.username,
  });

  factory AwaitingInvitation.fromJson(Map<String, dynamic> json) =>
      _$AwaitingInvitationFromJson(json);

  final int? invitation_id;
  final String? username;

  Map<String, dynamic> toJson() => _$AwaitingInvitationToJson(this);

  @override
  List<Object?> get props => [invitation_id, username];

  AwaitingInvitation copyWith({
    int? invitation_id,
    String? username,
  }) {
    return AwaitingInvitation(
      invitation_id: invitation_id ?? this.invitation_id,
      username: username ?? this.username,
    );
  }
}
