import 'package:flutter/material.dart';

class ValidationRepository {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Задайте електронну пошту';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Введіть корректну електронну пошту';
    }

    return null;
  }

  String? validatePassword(String? value) {
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

  String? validateRepeatPassword(
      String? value, TextEditingController passwordController) {
    if (value == null || value.isEmpty) {
      return 'Задайте пароль ще раз';
    }

    if (value != passwordController.text) {
      return 'Паролі не співпадають';
    }

    return null;
  }

  bool validateGender(String? value, bool isGenderValidated) {
    if (value == null || value.isEmpty) {
      isGenderValidated = false;
      return false;
    } else {
      isGenderValidated = true;
      return true;
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Задайте ім\'я';
    }

    if (value.length < 3) {
      return 'Введіть корректне ім\'я';
    }

    return null;
  }

  String? validateSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Задайте прізвище';
    }

    if (value.length < 3) {
      return 'Введіть корректне прізвище';
    }

    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Задайте номер телефона';
    }

    if (value.isNotEmpty && value.length != 10) {
      return 'Введіть корректний номер телефона';
    }

    return null;
  }
}
