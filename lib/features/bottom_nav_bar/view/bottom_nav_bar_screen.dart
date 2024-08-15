import 'package:buduar/constants.dart';
import 'package:buduar/features/bottom_nav_bar/widgets/widgets.dart';
import 'package:buduar/features/favorite/favorite.dart';
import 'package:buduar/features/cataloge/cataloge.dart';
import 'package:buduar/features/profile/profile.dart';
import 'package:buduar/features/shopping_cart/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _index = 0;
  final _screens = [
    const CatalogeScreen(),
    const ShoppingCartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  void _onItemSelected(int index) {
    _vibration();
    setState(() {
      _index = index;
    });
  }

  void _vibration() {
    HapticFeedback.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: kMainColor,
          indicatorColor: Colors.transparent,
          overlayColor: kTransparentColor,
          labelTextStyle: kBottomTextStyle,
        ),
        child: NavigationBar(
            height: 65,
            selectedIndex: _index,
            onDestinationSelected: (index) {
              _onItemSelected(index);
            },
            destinations: const [
              NavBarItemWidget(
                icon: FontAwesomeIcons.shirt,
                label: " Каталог",
              ),
              NavBarItemWidget(
                icon: FontAwesomeIcons.cartShopping,
                label: " Корзина",
              ),
              NavBarItemWidget(
                icon: FontAwesomeIcons.solidHeart,
                label: "Улюблене",
                size: 28,
              ),
              NavBarItemWidget(
                icon: FontAwesomeIcons.solidUser,
                label: "Профіль",
              ),
            ],
          ),
      ),
    );
  }
}
