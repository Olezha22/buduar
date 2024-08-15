import 'package:buduar/buduar_app.dart';
import 'package:buduar/constants.dart';
import 'package:buduar/features/forgot_password/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _closeKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _vibration() {
    HapticFeedback.selectionClick();
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

  void _onPressedButtonResetPassword() {
    _closeKeyboard();
    _vibration();
    if (_formKey.currentState!.validate()) {
      buduarNavigatorKey.currentState!
          .pushNamedAndRemoveUntil('/bottomNavBar', (route) => false);
    } else {
      _isAutoValidate.value = true;
    }
  }

  void _navigateToLogIn() {
    _closeKeyboard();
    _vibration();
    // buduarNavigatorKey.currentState!.pushReplacementNamed('/login');
    Get.offNamed('/login');
  }

  void _navigateToRegistration() {
    _closeKeyboard();
    _vibration();
    buduarNavigatorKey.currentState!.pushReplacementNamed('/registration');
    Get.offNamed('/registration');
  }

  var _isAutoValidate = false.obs;
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
                            'Забули пароль?',
                            style: kTitleStyle,
                          ),
                          const SizedBox(height: 20),
                          Obx(() {
                            return InputFieldWidget(
                              validate: _validateEmail,
                              isAutoValidate: _isAutoValidate.value,
                              controller: _emailController,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              label: 'Електронна адреса',
                              hint: 'makslit@gmail.com',
                            );
                          }),
                          const SizedBox(height: 20),
                          ButtonResetPasswordWidget(
                            onPressed: _onPressedButtonResetPassword,
                          ),
                          const SizedBox(height: 10),
                          UnderlinedButtonWidget(
                            text: "Увійти",
                            onPressed: _navigateToLogIn,
                          ),
                          const SizedBox(height: 10),
                          UnderlinedButtonWidget(
                            text: "Зареєструватися",
                            onPressed: _navigateToRegistration,
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
