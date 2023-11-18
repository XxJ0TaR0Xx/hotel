import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

class InputText extends StatelessWidget {
  final String lableText;
  final bool numberMask;
  final TextEditingController controller;
  final bool isValid;
  final Function()? function;

  const InputText({
    super.key,
    required this.lableText,
    required this.controller,
    required this.isValid,
    this.numberMask = false,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    String? mask;

    if (numberMask) {
      mask = "+7-###-###-##-##";
    }

    String? check() {
      if (!isValid) {
        return 'Не корректный ввод';
      }
      return null;
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
        onEditingComplete: function,
        decoration: InputDecoration(
          errorText: check(),
          prefixIcon: const SizedBox(),
          prefixIconConstraints: const BoxConstraints(minWidth: 16.0),
          labelText: lableText,
          labelStyle: const TextStyle(color: Color(0xFFA9ABB7)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
