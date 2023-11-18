import 'package:flutter/material.dart';

class AddressOfHotel extends StatelessWidget {
  final String addressHotel;
  const AddressOfHotel({
    super.key,
    required this.addressHotel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          padding: const EdgeInsets.symmetric(vertical: 0),
        ),
        child: Text(
          addressHotel,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
