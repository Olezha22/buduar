import 'package:flutter/material.dart';

  class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Divider(
        color: Colors.grey,
        height: 1,
      ),
    );
  }
}