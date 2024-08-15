import 'package:buduar/buduar_app.dart';
import 'package:buduar/constants.dart';
import 'package:buduar/features/un_authorized/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnAuthorizedScreen extends StatelessWidget {
  const UnAuthorizedScreen({super.key});

  void _onPressedLogIn() {
    _vibration();
    buduarNavigatorKey.currentState!.pushNamed('/login');
  }

  void _onPressedLogUp() {
    _vibration();
    buduarNavigatorKey.currentState!.pushNamed('/registration');
  }

  void _vibration() {
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Авторизація"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'Спочатку потрібно авторизуватися!',
                      textAlign: TextAlign.center,
                      style: kTitleStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonLogInUpWidget(
                    text: 'Увійти',
                    onPressed: _onPressedLogIn,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonLogInUpWidget(
                    text: 'Зареєструватися',
                    onPressed: _onPressedLogUp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
