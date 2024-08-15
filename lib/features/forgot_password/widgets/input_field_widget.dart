import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldWidget extends StatelessWidget {
  final bool? isObscured;
  final String? Function(String?)? validate;
  final bool isAutoValidate;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final VoidCallback? changeObscured;
  final String label;
  final String hint;

  const InputFieldWidget({
    super.key,
    this.isObscured,
    required this.validate,
    required this.isAutoValidate,
    this.textInputAction,
    required this.controller,
    this.textInputType,
    this.changeObscured,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscured ?? false,
      validator: validate,
      autovalidateMode: isAutoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      keyboardType: textInputType ?? TextInputType.visiblePassword,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r"[a-zA-Z0-9@#$%^&*()_+={}|\[\]\\:';\<>,.?/~`-]"),
        ),
      ],
      textInputAction: textInputAction ?? TextInputAction.next,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: changeObscured != null
            ? IconButton(
                icon: Icon(isObscured ?? false
                    ? Icons.visibility
                    : Icons.visibility_off),
                color: Colors.black,
                onPressed: () {
                  if (changeObscured != null) {
                    changeObscured!();
                  }
                },
              )
            : null,
        errorStyle: kInputErrorStyle,
        labelText: label,
        labelStyle: kInputLabelStyle,
        hintText: hint,
        hintStyle: kInputHintStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      style: kBlackStyleDefFontw500,
      cursorColor: Colors.black,
    );
  }
}
