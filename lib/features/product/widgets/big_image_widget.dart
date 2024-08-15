import 'package:flutter/material.dart';

class BigImageWidget extends StatelessWidget {
  final String image;
  final int index;
  const BigImageWidget({
    super.key,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
