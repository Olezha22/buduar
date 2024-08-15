import 'package:buduar/constants.dart';
import 'package:flutter/material.dart';

class PushMessagesScreen extends StatefulWidget {
  const PushMessagesScreen({super.key});

  @override
  State<PushMessagesScreen> createState() => _PushMessagesScreenState();
}

class _PushMessagesScreenState extends State<PushMessagesScreen> {
  bool _isPushEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroudColor,
      appBar: AppBar(
        title: const Text("Сповіщення"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: ListTile(
              title: const Text(
                "Push-сповіщення",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              trailing: Switch(
                activeColor: kMainColor,
                value: _isPushEnabled,
                onChanged: (value) {
                  setState(() {
                    _isPushEnabled = value;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
