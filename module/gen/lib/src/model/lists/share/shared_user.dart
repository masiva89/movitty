// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shared_user.g.dart';

@JsonSerializable()
@immutable
final class SharedUser with EquatableMixin {
  const SharedUser({
    this.user_id,
    this.username,
  });

  factory SharedUser.fromJson(Map<String, dynamic> json) =>
      _$SharedUserFromJson(json);

  final String? user_id;
  final String? username;

  Map<String, dynamic> toJson() => _$SharedUserToJson(this);

  @override
  List<Object?> get props => [user_id, username];

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
