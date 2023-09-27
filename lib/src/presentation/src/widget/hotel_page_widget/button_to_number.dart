import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonToNumber extends StatelessWidget {
  final String text;
  final Widget destination;
  const ButtonToNumber({
    super.key,
    required this.text,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CupertinoButton(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            color: const Color(0xFF0D72FF),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => destination),
              );
            },
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
