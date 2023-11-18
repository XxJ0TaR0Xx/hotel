import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Widget widget;
  final double rad;
  const MyContainer({
    super.key,
    required this.widget,
    this.rad = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(rad)),
        color: const Color(0xFFFFFFFF),
      ),
      child: widget,
    );
  }
}
