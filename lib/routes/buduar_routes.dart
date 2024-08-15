import 'package:buduar/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:buduar/features/change_password/change_password.dart';
import 'package:buduar/features/complete_order/complete_order.dart';
import 'package:buduar/features/contact_us/contact_us.dart';
import 'package:buduar/features/empty_cart/empty_cart.dart';
import 'package:buduar/features/empty_favorite/empty_favorite.dart';
import 'package:buduar/features/favorite/favorite.dart';
import 'package:buduar/features/forgot_password/view/forgot_password_screen.dart';
import 'package:buduar/features/my_details/my_details.dart';
import 'package:buduar/features/cataloge/cataloge.dart';
import 'package:buduar/features/our_shops/our_shops.dart';
import 'package:buduar/features/our_social_media/our_social_media.dart';
import 'package:buduar/features/privacy_and_policies/privacy_and_policies.dart';
import 'package:buduar/features/profile/profile.dart';
import 'package:buduar/features/push_messages/push_messages.dart';
import 'package:buduar/features/auth/registration/registration.dart';
import 'package:buduar/features/auth/login/login.dart';
import 'package:buduar/features/shopping_cart/shopping_cart.dart';
import 'package:buduar/features/un_authorized/un_authorized.dart';

final buduarRoutes = {
  '/registration': (context) => const RegistrationScreen(),
  '/login': (context) => const LoginScreen(),
  '/bottomNavBar': (context) => const BottomNavBarScreen(),
  '/myDetails': (context) => const MyDetailsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/unAuthorized': (context) => const UnAuthorizedScreen(),
  '/changePassword': (context) => const ChangePasswordScreen(),
  '/forgotPassword': (context) => const ForgotPasswordScreen(),
  '/ourShops': (context) => const OurShopsScreen(),
  '/ourSocialMedia': (context) => const OurSocialMediaScreen(),
  '/contactUs': (context) => const ContactUsScreen(),
  '/pushMessages': (context) => const PushMessagesScreen(),
  '/privacyAndPolicies': (context) => const PrivacyAndPoliciesScreen(),
  '/emptyFavorite': (context) => const EmptyFavoriteScreen(),
  '/favorite': (context) => const FavoriteScreen(),
  '/emptyCart': (context) => const EmptyCartScreen(),
  '/cart': (context) => const ShoppingCartScreen(),
  '/completeOrder': (context) => const CompleteOrderScreen(),
  '/novelty': (context) => const CatalogeScreen(),
};
