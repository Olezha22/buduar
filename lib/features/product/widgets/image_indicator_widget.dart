import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageIndicatorWidget extends StatelessWidget {
  final int length;
  final int currIndex;
  const ImageIndicatorWidget({
    super.key,
    required this.length,
    required this.currIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSmoothIndicator(
              count: length,
              activeIndex: currIndex,
              effect: const SlideEffect(
                activeDotColor: kMainColor,
                dotColor: Colors.white,
                dotWidth: 10,
                dotHeight: 10,
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
      ],
    );
  }
}
