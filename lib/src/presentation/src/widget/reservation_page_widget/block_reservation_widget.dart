import 'package:flutter/material.dart';

class BlocReservation extends StatelessWidget {
  final String dateDiscription;
  final String date;
  const BlocReservation({
    super.key,
    required this.dateDiscription,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        right: 16.0,
        left: 16.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextReservation(
              text: dateDiscription,
              colorHex: const Color(0xFF828796),
            ),
          ),
          Expanded(
            child: TextReservation(
              text: date,
              colorHex: const Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}

class TextReservation extends StatelessWidget {
  final String text;
  final Color colorHex;
  const TextReservation({
    super.key,
    required this.text,
    required this.colorHex,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: colorHex,
        fontSize: 16.0,
      ),
    );
  }
}
