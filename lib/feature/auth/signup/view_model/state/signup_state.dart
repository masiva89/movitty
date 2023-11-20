// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class SignupState extends Equatable {
  const SignupState({required this.isLoading});

  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];

  SignupState copyWith({bool? isLoading}) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
