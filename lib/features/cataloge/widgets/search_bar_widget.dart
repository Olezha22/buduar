import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController searchFieldController;
  const SearchBarWidget({
    super.key,
    required this.searchFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchFieldController,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 242, 238, 238),
        prefixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Colors.black,
        ),
        hintText: "Пляжні тапочки",
        hintStyle: kInputHintStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
      style: kBlackStyleDefFontw500,
      cursorColor: Colors.black,
    );
  }
}
