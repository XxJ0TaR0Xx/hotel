import 'package:flutter/material.dart';

class DescriptionHotel extends StatelessWidget {
  final String description;
  const DescriptionHotel({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
