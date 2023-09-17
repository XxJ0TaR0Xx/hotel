import 'package:flutter/material.dart';

class ForbiddenPage extends StatelessWidget {
  const ForbiddenPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '404\nPage not Found',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
