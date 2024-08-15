import 'package:buduar/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:buduar/features/auth/models/user_model.dart';
import 'package:buduar/features/auth/data/user_preferences.dart';
import 'package:buduar/routes/buduar_routes.dart';
import 'package:buduar/themes/buduar_theme.dart';
import 'package:flutter/material.dart';
import 'package:buduar/features/auth/registration/registration.dart';

final GlobalKey<NavigatorState> buduarNavigatorKey =
    GlobalKey<NavigatorState>();

class BuduarApp extends StatelessWidget {
  const BuduarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: buduarTheme,
        routes: buduarRoutes,
        navigatorKey: buduarNavigatorKey,
        home: FutureBuilder(
          future: RememberUserPrefs.readUserInfo(),
          builder: (context, AsyncSnapshot<UserModel?> dataSnapShot) {
            if (dataSnapShot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (dataSnapShot.hasError) {
              return Text('Error: ${dataSnapShot.error}');
            } else {
              if (dataSnapShot.data == null) {
                return const RegistrationScreen();
              } else {
                return const BottomNavBarScreen();
              }
            }
          },
        ));
  }
}
