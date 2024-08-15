import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class NavBarItemWidget extends StatelessWidget {
  final IconData? icon;
  final String label;
  final double? size;

  const NavBarItemWidget({
    super.key,
    this.icon,
    required this.label,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Padding(
        padding:
            EdgeInsets.only(top: size == null ? 18.0 : 18.0 - (size! - 25.0)),
        child: Icon(
          icon,
          color: kBottomIconColor,
          size: size ?? 25,
        ),
      ),
      selectedIcon: Padding(
        padding:
            EdgeInsets.only(top: size == null ? 18.0 : 18.0 - (size! - 25.0)),
        child: Icon(
          icon,
          color: kBottomSelIconColor,
          size: size ?? 25,
        ),
      ),
      label: label,
    );
  }
}
