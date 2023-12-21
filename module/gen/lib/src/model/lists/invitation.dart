// ignore_for_file:  non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'invitation.g.dart';

@JsonSerializable()
@immutable

/// Represents an invitation model.
///
/// An invitation contains information such as its ID, the sender, and the name
/// of the list it belongs to.
class Invitation extends INetworkModel<Invitation> with EquatableMixin {
  /// Creates a new instance of [Invitation].
  ///
  /// * [id] is the ID of the invitation.
  /// * [from] is the sender of the invitation.
  /// * [list_name] is the name of the list the invitation belongs to.
  Invitation({
    this.id,
    this.from,
    this.list_name,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);

  /// The ID of the invitation.
  final int? id;

  /// The sender of the invitation.
  final String? from;

  /// The name of the list the invitation belongs to.
  final String? list_name;

  @override
  Invitation fromJson(Map<String, dynamic> json) {
    return _$InvitationFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$InvitationToJson(this);

  @override
  List<Object?> get props => [id, from, list_name];

  /// Creates a copy of the invitation with the specified fields replaced.
  ///
  /// If any of the fields are not provided, the corresponding field from the
  /// original invitation is used.
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
