import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class PopularProductWidget extends StatelessWidget {
  final String image;
  final String price;
  final String title;
  final VoidCallback onPressed;
  const PopularProductWidget({
    super.key,
    required this.image,
    required this.price,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
          height: 293,
          width: 175,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                height: 230,
              ),
              const SizedBox(height: 3),
              Text(
                title,
                maxLines: 2,
                style: const TextStyle(
                  fontFamily: "",
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                price,
                style: kBlackStyleDefFont16w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}