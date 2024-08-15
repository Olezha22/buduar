import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  final String assetIcon;
  final String label;
  const CategoryItemWidget(
      {super.key, required this.assetIcon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: kMainColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                assetIcon,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "",
            ),
          ),
        ],
      ),
    );
  }
}