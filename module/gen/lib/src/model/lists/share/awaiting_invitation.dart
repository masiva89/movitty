// ignore_for_file:  non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'awaiting_invitation.g.dart';

@JsonSerializable()
@immutable

/// Represents an awaiting invitation in the Movitty application.
///
/// An [AwaitingInvitation] object contains information about an invitation
/// that is awaiting a response. It includes the invitation ID and the username
/// of the recipient.
class AwaitingInvitation extends INetworkModel<AwaitingInvitation>
    with EquatableMixin {
  /// Creates a new instance of [AwaitingInvitation].
  ///
  /// The [invitation_id] and [username] parameters are optional.
  AwaitingInvitation({
    this.invitation_id,
    this.username,
  });

  /// Creates a new instance of [AwaitingInvitation] from a JSON map.
  ///
  /// The [json] parameter is a map containing the JSON data.
  factory AwaitingInvitation.fromJson(Map<String, dynamic> json) =>
      _$AwaitingInvitationFromJson(json);

  /// The ID of the invitation.
  final int? invitation_id;

  /// The username of the recipient.
  final String? username;

  @override
  AwaitingInvitation fromJson(Map<String, dynamic> json) {
    return _$AwaitingInvitationFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$AwaitingInvitationToJson(this);

  @override
  List<Object?> get props => [invitation_id, username];

  /// Creates a copy of this [AwaitingInvitation] object with the specified
  /// fields replaced.
  ///
  /// The [invitation_id] and [username] parameters are optional.
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
