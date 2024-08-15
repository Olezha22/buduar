import 'package:buduar/buduar_app.dart';
import 'package:buduar/constants.dart';
import 'package:buduar/features/change_password/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final _formKey = GlobalKey<FormState>();

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
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

  String? _validateRepeatPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Задайте пароль ще раз';
    }

    if (value != _passwordController.text) {
      return 'Паролі не співпадають';
    }

    return null;
  }

  void _changeObscured() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _onPressedForgotPassword() {
    _closeKeyboard();
    _vibration();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Інструкція з відновленням паролю відправлена',
            style: kTitleStyle,
          ),
          content: const Text(
              'Перевірте свою електронну пошту, можливо провірте папку "Спам".'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                buduarNavigatorKey.currentState!
                    .pushNamedAndRemoveUntil('/bottomNavBar', (route) => false);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _onPressedChangePassword() {
    _closeKeyboard();
    _vibration();
    if (_formKey.currentState!.validate()) {
      buduarNavigatorKey.currentState!
          .pushNamedAndRemoveUntil('/bottomNavBar', (route) => false);
    } else {
      setState(() {
        _isAutoValidate = true;
      });
    }
  }

  bool _isAutoValidate = false;

  bool _isObscured = true;

  void _onPasswordSubmitted() {
    FocusScope.of(context).nextFocus();
  }

  void _closeKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _vibration() {
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Змінити пароль"),
      ),
      body: GestureDetector(
        onTap: _closeKeyboard,
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputFieldWidget(
                        validate: _validatePassword,
                        isAutoValidate: _isAutoValidate,
                        controller: _oldPasswordController,
                        textInputType: TextInputType.visiblePassword,
                        label: 'Поточний пароль',
                        hint: 'Maks123',
                        isObscured: _isObscured,
                        changeObscured: _changeObscured,
                        onFieldSubmitted: _onPasswordSubmitted,
                      ),
                      const SizedBox(height: 16),
                      InputFieldWidget(
                        validate: _validatePassword,
                        isAutoValidate: _isAutoValidate,
                        controller: _passwordController,
                        textInputType: TextInputType.visiblePassword,
                        label: 'Новий пароль',
                        hint: 'Maks123',
                        isObscured: _isObscured,
                        changeObscured: _changeObscured,
                        onFieldSubmitted: _onPasswordSubmitted,
                      ),
                      const SizedBox(height: 16),
                      InputFieldWidget(
                        validate: _validateRepeatPassword,
                        isAutoValidate: _isAutoValidate,
                        controller: _repeatPasswordController,
                        textInputType: TextInputType.visiblePassword,
                        label: 'Повторіть пароль',
                        hint: 'Maks123',
                        isObscured: _isObscured,
                        changeObscured: _changeObscured,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: 16),
                      ButtonChangePasswordWidget(
                        onPressed: _onPressedChangePassword,
                      ),
                      const SizedBox(height: 10),
                      UnderlinedButtonWidget(
                        text: "Забули пароль?",
                        onPressed: _onPressedForgotPassword,
                      ),
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
