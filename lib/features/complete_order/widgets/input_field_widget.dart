import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldWidget extends StatelessWidget {
  final bool? isObscured;
  final String? Function(String?)? validate;
  final bool isAutoValidate;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final VoidCallback? changeObscured;
  final String label;
  final String hint;
  final VoidCallback? onFieldSubmitted;
  final bool? inputFormat;
  final void Function(String)? onChanged;
  final bool? readOnly;
  final VoidCallback? onPressed;

  const InputFieldWidget({
    super.key,
    this.isObscured,
    required this.validate,
    required this.isAutoValidate,
    required this.controller,
    this.textInputType,
    this.changeObscured,
    required this.label,
    required this.hint,
    this.onFieldSubmitted,
    this.inputFormat,
    this.onChanged,
    this.readOnly,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onPressed,
      readOnly: readOnly ?? false,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      obscureText: isObscured ?? false,
      validator: validate,
      autovalidateMode: isAutoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      keyboardType: textInputType ?? TextInputType.visiblePassword,
      inputFormatters: [
        inputFormat == null
            ? FilteringTextInputFormatter.allow(
                RegExp(r"[a-zA-Z0-9@#$%^&*()_+={}|\[\]\\:';\<>,.?/~`-]"),
              )
            : FilteringTextInputFormatter.allow(
                RegExp(r"[0-9]"),
              ),
      ],
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted!();
        }
      },
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
