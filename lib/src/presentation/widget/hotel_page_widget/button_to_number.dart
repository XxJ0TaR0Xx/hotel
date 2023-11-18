import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonToNumber extends StatelessWidget {
  final String text;
  final Widget destination;
  final Function? function;
  final bool? check;
  const ButtonToNumber({
    super.key,
    required this.text,
    required this.destination,
    this.function,
    this.check,
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
              if (check == true || check == null) {
                if (function != null) function!();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => destination),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('НЕ РАБОТАЕТ БЛЯТЬ Я ЕБВЛ '),
                  ),
                );
              }
            },
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
