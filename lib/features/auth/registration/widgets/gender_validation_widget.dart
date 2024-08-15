import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class GenderValidationWidget extends StatelessWidget {
  final bool isAutoValidate;
  final String? Function(String?) validateGender;
  final String gender;
  const GenderValidationWidget({
    super.key,
    required this.isAutoValidate,
    required this.validateGender,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return isAutoValidate && validateGender(gender) != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    validateGender(gender)!,
                    style: kInputErrorStyle,
                  ),
                ),
              ),
            ],
          )
        : const SizedBox(height: 0);
  }
}
