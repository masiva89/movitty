// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/lists/share/awaiting_invitation.dart';
import 'package:gen/src/model/lists/share/shared_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'share_info.g.dart';

@JsonSerializable()
@immutable
final class ShareInfo with EquatableMixin {
  const ShareInfo({
    this.awaiting_invitations,
    this.shared_users,
  });

  factory ShareInfo.fromJson(Map<String, dynamic> json) =>
      _$ShareInfoFromJson(json);

  final List<AwaitingInvitation>? awaiting_invitations;
  final List<SharedUser>? shared_users;

  Map<String, dynamic> toJson() => _$ShareInfoToJson(this);

  @override
  List<Object?> get props => [awaiting_invitations, shared_users];

  ShareInfo copyWith({
    List<AwaitingInvitation>? awaiting_invitations,
    List<SharedUser>? shared_users,
  }) {
    return ShareInfo(
      awaiting_invitations: awaiting_invitations ?? this.awaiting_invitations,
      shared_users: shared_users ?? this.shared_users,
    );
  }
}
