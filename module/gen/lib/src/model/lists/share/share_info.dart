// ignore_for_file:  non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gen/src/model/lists/share/awaiting_invitation.dart';
import 'package:gen/src/model/lists/share/shared_user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'share_info.g.dart';

@JsonSerializable()
@immutable

/// Represents the share information for a particular item.
/// This class is used to deserialize JSON data and provide convenient methods
/// for working with share information.
class ShareInfo extends INetworkModel<ShareInfo> with EquatableMixin {
  /// Constructs a new instance of [ShareInfo].
  ShareInfo({
    this.awaiting_invitations,
    this.shared_users,
  });

  /// Constructs a new instance of [ShareInfo] from a JSON map.
  factory ShareInfo.fromJson(Map<String, dynamic> json) =>
      _$ShareInfoFromJson(json);

  /// A list of awaiting invitations for the shared item.
  final List<AwaitingInvitation>? awaiting_invitations;

  /// A list of users with whom the item is shared.
  final List<SharedUser>? shared_users;

  @override
  ShareInfo fromJson(Map<String, dynamic> json) {
    return _$ShareInfoFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$ShareInfoToJson(this);

  @override
  List<Object?> get props => [awaiting_invitations, shared_users];

  /// Creates a copy of this [ShareInfo] instance with the specified fields
  /// replaced with new values.
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
