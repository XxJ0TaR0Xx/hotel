import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        right: 15.0,
        left: 53.0,
      ),
      child: Divider(height: 1.0),
    );
  }
}
