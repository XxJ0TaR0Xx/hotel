import 'package:flutter/cupertino.dart';

class ButtonToNumber extends StatelessWidget {
  final String text;
  const ButtonToNumber({
    super.key,
    required this.text,
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
            onPressed: () {},
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
