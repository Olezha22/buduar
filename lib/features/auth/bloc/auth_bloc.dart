import 'dart:convert';

import 'package:buduar/api_connection/api_connection.dart';
import 'package:buduar/features/auth/models/user_model.dart';
import 'package:buduar/features/auth/registration/repositories/validation_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool isObscured = true;
  bool isAutoValidate = false;
  String gender = "";
  bool isGenderValid = false;

  AuthBloc() : super(AuthInitial()) {
    on<RegisterUser>((event, emit) async {
      emit(AuthLoading());
      try {
        var res = await http.post(Uri.parse(Api.validatePhoneNumber), body: {
          'user_phoneNumber': event.phoneNumber,
        });

        if (res.statusCode == 200) {
          var resBodyOfValidateEmail = jsonDecode(res.body);

          if (resBodyOfValidateEmail['success'] == true) {
            emit(AuthLoadingFailure(
                exception: "Такий номер телефона вже використовується"));
          } else {
            UserModel userModel = UserModel(
              1,
              event.name,
              event.surName,
              "",
              event.phoneNumber,
              event.gender,
              "",
              event.password,
            );
            try {
              var res = await http.post(
                Uri.parse(Api.signUp),
                body: userModel.toJson(),
              );
              if (res.statusCode == 200) {
                var resBodySignUp = jsonDecode(res.body);
                if (resBodySignUp['success']) {
                  emit(AuthLoaded());
                } else {
                  emit(AuthLoadingFailure(exception: "Щось пішло не так"));
                }
              }
            } catch (e) {
              emit(AuthLoadingFailure(exception: "Проблеми з інтернетом"));
            }
          }
        } else {
          emit(AuthLoadingFailure(
              exception: "Помилка серверу: ${res.statusCode}"));
        }
      } catch (e) {
        emit(AuthLoadingFailure(exception: "Проблеми з інтернетом"));
      }
    });

    on<ChooseGender>((event, emit) {
      gender = event.gender;
      emit(GenderChosen(gender: gender));
    });

    on<ValidateGender>((event, emit) {
      isGenderValid = ValidationRepository().validateGender(event.gender, true);
      emit(GenderValidated(isValid: isGenderValid));
    });

    on<ToggleObscured>((event, emit) {
      isObscured = !isObscured;
      emit(ObscuredState(isObscured: isObscured));
    });

    on<SetAutoValidate>((event, emit) {
      isAutoValidate = event.isAutoValidate;
      emit(AutoValidateState(isAutoValidate: isAutoValidate));
    });
  }
}
