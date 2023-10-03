import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

class InputText extends StatelessWidget {
  final String lableText;
  final bool numberMask;
  final TextEditingController controller;

  const InputText({
    super.key,
    required this.lableText,
    required this.controller,
    this.numberMask = false,
  });

  @override
  Widget build(BuildContext context) {
    String? mask;

    if (numberMask) {
      mask = "+7-###-###-##-##";
    }

    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0xFFF6F6F9),
      ),
      child: MaskedTextField(
        controller: controller,
        mask: mask,
        maxLines: 1,
        decoration: InputDecoration(
          prefixIcon: const SizedBox(),
          prefixIconConstraints: const BoxConstraints(minWidth: 16.0),
          labelText: lableText,
          labelStyle: const TextStyle(
            color: Color(0xFFA9ABB7),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
