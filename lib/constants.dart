import 'package:flutter/material.dart';

const kMainColor = Color(0xFFB280B5);

const kMainBackgroudColor = Color.fromARGB(255, 234, 213, 235);

const kCompleteOrderBackColor = Color.fromARGB(255, 174, 111, 195);
const kCompleteOrderForeColor = Color.fromARGB(255, 231, 222, 222);

const kMainItemColor = Color.fromARGB(255, 245, 241, 241);

const kViberColor = Color(0xFF665CAC);
const kInstagramColor = Color(0xFFE4405F);

final kLogInUpButtonColor = MaterialStateProperty.all<Color?>(
  Colors.purple[100],
);

final kLigherBlueButtonColor = MaterialStateProperty.all<Color>(
  Colors.purple.shade50,
);

final kLogInUpButtonColorSimple = Colors.purple[100];

final kTransparentColor = MaterialStateProperty.all<Color?>(
  Colors.transparent,
);
final kDarkGreyColor = Colors.grey.shade600;

const kBottomIconColor = Color.fromARGB(255, 213, 187, 218);

const kBottomSelIconColor = Color(0xFFF3E5F5);

const kMainBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 193, 150, 195),
      Color(0xFFB280B5),
    ],
  ),
);

final kLogInUpDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(30),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(255, 249, 189, 232),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3),
    ),
  ],
);

final kBottomTextStyle = MaterialStateProperty.all(
  const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 12,
  ),
);

const kTitleStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

const kBlackStyleDefFontw500 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontFamily: "",
);

const kModernGreyStyle25 = TextStyle(
  color: Color.fromARGB(255, 84, 81, 81),
  fontSize: 25,
);

const kModernGreyStyle18 = TextStyle(
  color: Color.fromARGB(255, 84, 81, 81),
  fontSize: 18,
);

const kInputLabelStyle = TextStyle(
  color: Colors.black54,
  fontFamily: "",
);
const kInputHintStyle = TextStyle(
  color: Colors.grey,
  fontFamily: "",
);

const kBlackStyleDefFont16 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontFamily: "",
  fontSize: 16,
);

const kBlackStyleDefFont16w700 = TextStyle(
  fontFamily: "",
  fontWeight: FontWeight.w700,
  fontSize: 16,
);

const kSimpleStyle = TextStyle(
  fontFamily: "",
);

const kSizeStyle = TextStyle(
  fontFamily: "",
  fontWeight: FontWeight.w700,
);
const kUnderlinedStyle = TextStyle(
  color: Color.fromARGB(255, 94, 16, 98),
  decoration: TextDecoration.underline,
);

final kInputErrorStyle = TextStyle(
  color: Colors.red.shade900,
  fontWeight: FontWeight.bold,
  fontSize: 12,
);

const kLighterBlackStyleDefFont16 = TextStyle(
  color: Colors.black54,
  fontFamily: "",
  fontSize: 16,
);

const k16w700SimpleButtonTextStyle = TextStyle(
  fontFamily: "",
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: Colors.black,
);

const kBlackTextStyle = TextStyle(
  color: Colors.black,
);

const kProductTitleStyle = TextStyle(
  letterSpacing: 1.5,
  fontFamily: "",
  fontSize: 25,
);

const kProductPriceStyle = TextStyle(
  fontFamily: "",
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

final kProductSubParamStyle = TextStyle(
  fontFamily: "",
  fontWeight: FontWeight.w500,
  color: Colors.grey.shade900,
);

final kButtonDecorAddToCart = BoxDecoration(
  border: Border.all(
    color: const Color.fromARGB(255, 172, 196, 242),
    width: 3.0,
  ),
  borderRadius: BorderRadius.circular(17),
);

const kButtonStyleAddToCart = TextStyle(
  fontFamily: "",
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: kMainColor,
);

final Uri uriShop1 =
    Uri.parse('https://maps.app.goo.gl/AogwtxFHqbogyrCK8?g_st=ic');
final Uri uriShop2 =
    Uri.parse('https://maps.app.goo.gl/phiwAGRfWYFXXrhs8?g_st=ic');

final Uri kUriViber = Uri.parse(
    'https://invite.viber.com/?g2=AQAXeqgZGkNVKktX0cDXP0BcNkQh6hC0vlTecRbovk4YIW7cTFpVRmA0m4LLHLkn');
final Uri kUriInstagram = Uri.parse(
    'https://www.instagram.com/buduar_truskavets?igsh=Y2MxMXFzaXl4MDNy');

final Uri kphoneNumber1 = Uri.parse('tel:+380982622460');
final Uri kphoneNumber2 = Uri.parse('tel:+380955731070');
