import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class ListViewItemWidget extends StatelessWidget {
  final String amount;
  final String description;
  final VoidCallback onPressedClose;
  final String image;
  const ListViewItemWidget(
      {super.key,
      required this.amount,
      required this.description,
      required this.onPressedClose,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: kMainItemColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                image,
                height: 150,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                              bottom: 1.0,
                            ),
                            child: Text(
                              amount,
                              style: kBlackStyleDefFont16w700,
                            ),
                          ),
                          Text(
                            description,
                            maxLines: 3,
                            style: const TextStyle(
                              fontFamily: "",
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kMainBackgroudColor,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: const Text(
                          "Додати в корзину",
                          style: TextStyle(
                            fontFamily: "",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kMainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.close,
                size: 28,
              ),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
