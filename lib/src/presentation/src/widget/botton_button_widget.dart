import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/src/widget/hotel_page_widget/button_to_number.dart';

class BottonButton extends StatelessWidget {
  final String text;
  const BottonButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 16.0,
        right: 16.0,
        bottom: 6.0,
      ),
      child: ButtonToNumber(text: text),
    );
  }
}
