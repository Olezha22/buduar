import 'package:buduar/buduar_app.dart';
import 'package:buduar/constants.dart';
import 'package:buduar/features/auth/bloc/auth_bloc.dart';
import 'package:buduar/features/auth/registration/repositories/validation_repository.dart';
import 'package:buduar/features/auth/registration/services/main_services.dart';
import 'package:buduar/features/auth/registration/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _formKey = GlobalKey<FormState>();

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  final _authBloc = AuthBloc();

  void _navigateToLogIn() {
    MainServices().vibration;
    MainServices().closeKeyboard(context);
    buduarNavigatorKey.currentState!.pushReplacementNamed("/login");
  }

  void _navigateToAssortiment() {
    MainServices().vibration;
    MainServices().closeKeyboard(context);
    buduarNavigatorKey.currentState!
        .pushNamedAndRemoveUntil('/bottomNavBar', (route) => false);
  }

  void _onPressedButtonRegistration() {
    MainServices().vibration;
    MainServices().closeKeyboard(context);
    if (_formKey.currentState!.validate() && _authBloc.isGenderValid) {
      _authBloc.add(RegisterUser(
        name: _nameController.text.trim(),
        surName: _surnameController.text.trim(),
        phoneNumber: _phoneNumberController.text.trim(),
        gender: _authBloc.gender,
        password: _passwordController.text.trim(),
      ));
    } else {
      _authBloc.add(SetAutoValidate(true));
    }
  }

  void _onChooseGender(String gender) {
    _authBloc.add(ChooseGender(gender));
    _authBloc.add(ValidateGender(gender));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: BlocProvider(
        create: (context) => _authBloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoaded) {
              Fluttertoast.showToast(msg: "Ви успішно зареєстровані");
              buduarNavigatorKey.currentState!
                  .pushNamedAndRemoveUntil('/bottomNavBar', (route) => false);
            } else if (state is AuthLoadingFailure) {
              Fluttertoast.showToast(msg: state.exception.toString());
            }
          },
          child: GestureDetector(
            onTap: () {
              MainServices().closeKeyboard(context);
            },
            child: Container(
              decoration: kMainBackgroundDecoration,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: kLogInUpDecoration,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CloseWindowWidget(),
                              const Text(
                                'Ви вперше у нас?',
                                style: kTitleStyle,
                              ),
                              const SizedBox(height: 20),
                              InputFieldWidget(
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    _nameController.value = TextEditingValue(
                                      text:
                                          value.substring(0, 1).toUpperCase() +
                                              value.substring(1),
                                      selection: _nameController.selection,
                                    );
                                  }
                                },
                                validate: ValidationRepository().validateName,
                                isAutoValidate: _authBloc.isAutoValidate,
                                controller: _nameController,
                                textInputType: TextInputType.name,
                                label: 'Ім\'я',
                                hint: 'Максим',
                                inputFormat: true,
                              ),
                              const SizedBox(height: 8),
                              InputFieldWidget(
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    _surnameController.value = TextEditingValue(
                                      text:
                                          value.substring(0, 1).toUpperCase() +
                                              value.substring(1),
                                      selection: _surnameController.selection,
                                    );
                                  }
                                },
                                validate:
                                    ValidationRepository().validateSurname,
                                isAutoValidate: _authBloc.isAutoValidate,
                                controller: _surnameController,
                                textInputType: TextInputType.name,
                                label: 'Прізвище',
                                hint: 'Літинський',
                                textInputAction: TextInputAction.done,
                                inputFormat: true,
                              ),
                              const SizedBox(height: 8),
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return GenderDialogWidget(
                                    gender: _authBloc.gender,
                                    onTapMen: () => _onChooseGender("Чоловік"),
                                    onTapWomen: () => _onChooseGender("Жінка"),
                                  );
                                },
                              ),
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return GenderValidationWidget(
                                    gender: _authBloc.gender,
                                    isAutoValidate: _authBloc.isAutoValidate,
                                    validateGender: (value) {
                                      return value == ""
                                          ? "Задайте стать"
                                          : null;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              InputFieldWidget(
                                validate:
                                    ValidationRepository().validatePhoneNumber,
                                isAutoValidate: _authBloc.isAutoValidate,
                                controller: _phoneNumberController,
                                textInputType: TextInputType.number,
                                inputFormat: false,
                                label: 'Номер телефона',
                                hint: '0681234567',
                              ),
                              const SizedBox(height: 8),
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return InputFieldWidget(
                                    validate:
                                        ValidationRepository().validatePassword,
                                    isAutoValidate: _authBloc.isAutoValidate,
                                    controller: _passwordController,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    label: 'Пароль',
                                    hint: 'Maks123',
                                    isObscured: _authBloc.isObscured,
                                    changeObscured: () {
                                      _authBloc.add(ToggleObscured());
                                    },
                                    onFieldSubmitted: () {
                                      FocusScope.of(context).nextFocus();
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return InputFieldWidget(
                                    validate: (value) {
                                      return ValidationRepository()
                                          .validateRepeatPassword(
                                              value, _passwordController);
                                    },
                                    isAutoValidate: _authBloc.isAutoValidate,
                                    controller: _repeatPasswordController,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    label: 'Повторіть пароль',
                                    hint: 'Maks123',
                                    isObscured: _authBloc.isObscured,
                                    changeObscured: () {
                                      _authBloc.add(ToggleObscured());
                                    },
                                    textInputAction: TextInputAction.done,
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              ButtonRegistrationWidget(
                                onPressed: _onPressedButtonRegistration,
                                child: BlocBuilder<AuthBloc, AuthState>(
                                  bloc: _authBloc,
                                  builder: (context, state) {
                                    if (state is AuthLoading) {
                                      return const SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.black,
                                        ),
                                      );
                                    }
                                    return const Text(
                                      'Зареєструватися',
                                      style: kBlackTextStyle,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              UnderlinedButtonWidget(
                                text: "Увійти",
                                onPressed: _navigateToLogIn,
                              ),
                              const SizedBox(height: 10),
                              UnderlinedButtonWidget(
                                text: "Переглянути асортимент",
                                onPressed: _navigateToAssortiment,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
