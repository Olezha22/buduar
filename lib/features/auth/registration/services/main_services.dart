import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainServices {
  void closeKeyboard(context) {
    FocusScope.of(context).unfocus();
  }

  void vibration() {
    HapticFeedback.selectionClick();
  }
}