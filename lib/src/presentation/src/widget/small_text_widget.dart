import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  const SmallText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: Color(0xFF828796),
      ),
    );
  }
}
