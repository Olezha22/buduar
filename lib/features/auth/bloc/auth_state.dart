part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoaded extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingFailure extends AuthState {
  AuthLoadingFailure({required this.exception});
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class GenderChosen extends AuthState {
  final String gender;

  GenderChosen({required this.gender});

  @override
  List<Object?> get props => [gender];
}


class GenderValidated extends AuthState {
  final bool isValid;

  GenderValidated({required this.isValid});

  @override
  List<Object?> get props => [isValid];
}

class ObscuredState extends AuthState {
  final bool isObscured;

  ObscuredState({required this.isObscured});

  @override
  List<Object?> get props => [isObscured];
}

class AutoValidateState extends AuthState {
  final bool isAutoValidate;

  AutoValidateState({required this.isAutoValidate});

  @override
  List<Object?> get props => [isAutoValidate];
}
