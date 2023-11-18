import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  const BigText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: Color(0xFF000000),
      ),
    );
  }
}
