import 'package:flutter/material.dart';

class PriceOfHotel extends StatelessWidget {
  final String priceHotel;
  final String priceForIt;
  const PriceOfHotel({
    super.key,
    required this.priceHotel,
    required this.priceForIt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$priceHotel ₽',
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8.0),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              priceForIt,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF828796),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
