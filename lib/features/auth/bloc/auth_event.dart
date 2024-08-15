part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class RegisterUser extends AuthEvent {
  final String name;
  final String surName;
  final String phoneNumber;
  final String gender;
  final String password;

  RegisterUser({
    required this.name,
    required this.surName,
    required this.phoneNumber,
    required this.gender,
    required this.password,
  });
  @override
  List<Object?> get props => [];
}

class ChooseGender extends AuthEvent {
  final String gender;

  ChooseGender(this.gender);

  @override
  List<Object?> get props => [gender];
}

class ValidateGender extends AuthEvent {
  final String gender;

  ValidateGender(this.gender);

  @override
  List<Object?> get props => [gender];
}

class ToggleObscured extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SetAutoValidate extends AuthEvent {
  final bool isAutoValidate;

  SetAutoValidate(this.isAutoValidate);

  @override
  List<Object?> get props => [isAutoValidate];
}
