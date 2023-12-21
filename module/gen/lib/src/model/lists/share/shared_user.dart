// ignore_for_file:  non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'shared_user.g.dart';

@JsonSerializable()
@immutable

/// Represents a shared user in the Movitty application.
///
/// This class is responsible for modeling a shared user, including their user
/// ID and username. It implements the [INetworkModel] interface and the
/// [EquatableMixin] mixin.
class SharedUser extends INetworkModel<SharedUser> with EquatableMixin {
  /// Constructs a new [SharedUser] instance.
  SharedUser({
    this.user_id,
    this.username,
  });

  /// Constructs a [SharedUser] instance from a JSON map.
  factory SharedUser.fromJson(Map<String, dynamic> json) =>
      _$SharedUserFromJson(json);

  /// The user ID of the shared user.
  final String? user_id;

  /// The username of the shared user.
  final String? username;

  @override
  SharedUser fromJson(Map<String, dynamic> json) {
    return _$SharedUserFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$SharedUserToJson(this);

  @override
  List<Object?> get props => [user_id, username];

  /// Creates a copy of this [SharedUser] instance with the specified fields
  /// replaced.
  SharedUser copyWith({
    String? user_id,
    String? username,
  }) {
    return SharedUser(
      user_id: user_id ?? this.user_id,
      username: username ?? this.username,
    );
  }
}
