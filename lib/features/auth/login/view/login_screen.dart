import 'dart:convert';

import 'package:buduar/api_connection/api_connection.dart';
import 'package:buduar/constants.dart';
import 'package:buduar/features/auth/login/widgets/widgets.dart';
import 'package:buduar/features/auth/models/user_model.dart';
import 'package:buduar/features/auth/data/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Задайте електронну пошту';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Введіть корректну електронну пошту';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Задайте пароль';
    }

    if (value.length < 6) {
      return 'Пароль повинен містити принаймі 6 символів';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Пароль повинен містити велику літеру';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Пароль повинен містити цифру';
    }

    return null;
  }

  void _changeObscured() {
    _isObscured.value = !_isObscured.value;
  }

  void _onPressedButtonLogIn() async {
    _closeKeyboard();
    _vibration();
    if (_formKey.currentState!.validate()) {
      var res = await http.post(
        Uri.parse(Api.logIn),
        body: {
          "user_email": _emailController.text.trim(),
          "user_password": _passwordController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodyOfLogIn = jsonDecode(res.body);
        if (resBodyOfLogIn['success'] == true) {
          Fluttertoast.showToast(msg: "Logged in");

          try {
            UserModel userInfo = UserModel.fromJson(resBodyOfLogIn["userData"]);

            await RememberUserPrefs.storeUserInfo(userInfo);
          } catch (e) {
            print("Error is: ${e.toString()}\n");
          }

          // buduarNavigatorKey.currentState!.pushNamed('/bottomNavBar');
          Get.offAllNamed('/bottomNavBar');
          RememberUserPrefs.readUserInfo();
        } else {
          Fluttertoast.showToast(
              msg: "Log in failed: ${resBodyOfLogIn['success']}");
        }
      } else {
        Fluttertoast.showToast(msg: "Server error: ${res.statusCode}");
      }
    } else {
      _isAutoValidate = true.obs;
    }
  }

  void _navigateToRegistration() {
    _closeKeyboard();
    _vibration();
    // buduarNavigatorKey.currentState!.pushReplacementNamed('/registration');
    Get.offNamed('/registration');
  }

  void _navigateToAssortiment() {
    _closeKeyboard();
    _vibration();
    // buduarNavigatorKey.currentState!
    //     .pushNamedAndRemoveUntil('/bottomNavBar', (route) => false);
    Get.offAllNamed('/bottomNavBar');
  }

  void _closeKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _vibration() {
    HapticFeedback.selectionClick();
  }

  void _onPressedForgotPassword() {
    _closeKeyboard();
    _vibration();
    // buduarNavigatorKey.currentState!.pushReplacementNamed('/forgotPassword');
    Get.offNamed('/forgotPassword');
  }

  var _isAutoValidate = false.obs;
  var _isObscured = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _closeKeyboard,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: kMainBackgroundDecoration,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                            'Увійти',
                            style: kTitleStyle,
                          ),
                          const SizedBox(height: 20),
                          Obx(
                            () => InputFieldWidget(
                              validate: _validateEmail,
                              isAutoValidate: _isAutoValidate.value,
                              controller: _emailController,
                              textInputType: TextInputType.emailAddress,
                              label: 'Електронна адреса',
                              hint: 'makslit@gmail.com',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(
                            () => InputFieldWidget(
                              validate: _validatePassword,
                              isAutoValidate: _isAutoValidate.value,
                              controller: _passwordController,
                              textInputType: TextInputType.visiblePassword,
                              label: 'Пароль',
                              hint: 'Maks123',
                              isObscured: _isObscured.value,
                              textInputAction: TextInputAction.done,
                              changeObscured: _changeObscured,
                            ),
                          ),
                          const SizedBox(height: 20),
                          ButtonLogInWidget(
                            onPressed: _onPressedButtonLogIn,
                          ),
                          const SizedBox(height: 10),
                          UnderlinedButtonWidget(
                            text: "Забули пароль?",
                            onPressed: _onPressedForgotPassword,
                          ),
                          const SizedBox(height: 10),
                          UnderlinedButtonWidget(
                            text: "Зареєструватися",
                            onPressed: _navigateToRegistration,
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
