// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class LoginState extends Equatable {
  const LoginState({required this.isLoading});

  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];

  LoginState copyWith({bool? isLoading}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
