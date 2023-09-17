import 'package:flutter/material.dart';

class AboutHotel extends StatelessWidget {
  final List<String> peculiarities;
  const AboutHotel({
    super.key,
    required this.peculiarities,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: peculiarities.map((peculiarity) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
            top: 8.0,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 16.0,
            ),
            decoration: const BoxDecoration(color: Color(0xFFFBFBFC)),
            child: Text(
              peculiarity,
              style: const TextStyle(color: Color(0xFF828796)),
            ),
          ),
        );
      }).toList(),
    );
  }
}
