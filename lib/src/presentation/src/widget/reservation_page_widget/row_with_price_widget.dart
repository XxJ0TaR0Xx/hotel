import 'package:flutter/material.dart';

class RowPrice extends StatelessWidget {
  final String priceForIt;
  final String price;
  final bool isBlue;
  const RowPrice({
    super.key,
    required this.priceForIt,
    required this.price,
    this.isBlue = false,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;

    if (isBlue) {
      color = const Color(0xFF0D72FF);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            priceForIt,
            style: const TextStyle(
              color: Color(0xFFA9ABB7),
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            '$price ₽',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
