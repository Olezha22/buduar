import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class GenderDialogWidget extends StatelessWidget {
  final String gender;
  final VoidCallback onTapMen;
  final VoidCallback onTapWomen;
  const GenderDialogWidget({
    super.key,
    required this.gender,
    required this.onTapMen,
    required this.onTapWomen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Оберіть стать',
                  style: TextStyle(
                    fontFamily: "",
                  )),
              content: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: const Text(
                        'Чоловік',
                        style: kBlackStyleDefFontw500,
                      ),
                      onTap: () {
                        onTapMen();
                      },
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                    const Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    ListTile(
                      title: const Text(
                        'Жінка',
                        style: kBlackStyleDefFontw500,
                      ),
                      onTap: () {
                        onTapWomen();
                      },
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              gender.isNotEmpty ? gender : 'Оберіть стать',
              style: gender.isEmpty
                  ? kLighterBlackStyleDefFont16
                  : kBlackStyleDefFont16,
            ),
            const Icon(Icons.arrow_downward),
          ],
        ),
      ),
    );
  }
}
