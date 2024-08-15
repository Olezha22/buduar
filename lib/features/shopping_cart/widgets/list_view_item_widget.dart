import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class ListViewItemWidget extends StatefulWidget {
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
  State<ListViewItemWidget> createState() => _ListViewItemWidgetState();
}

class _ListViewItemWidgetState extends State<ListViewItemWidget> {
  final int _counter = 1;
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // void _decrementCounter() {
  //   setState(() {
  //     if (_counter > 1) {
  //       _counter--;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 130,
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
                widget.image,
                height: 120,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: SizedBox(
                  height: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              widget.amount,
                              style: kBlackStyleDefFont16w700,
                            ),
                          ),
                          Text(
                            widget.description,
                            maxLines: 3,
                            style: const TextStyle(
                              fontFamily: "",
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Розмір: ",
                                style: kSimpleStyle,
                              ),
                              Text(
                                "S",
                                style: kSizeStyle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.remove_circle_outline_sharp,
                                size: 27,
                                color: Colors.grey[700],
                              ),
                              Text(
                                ' $_counter ',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontFamily: "",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.add_circle_outline_sharp,
                                size: 27,
                                color: Colors.grey[700],
                              ),
                            ],
                          ),
                        ],
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
