import 'package:flutter/material.dart';
import 'package:hotel/src/presentation/widget/common_widgets/big_text_widget.dart';

class NameOfHotel extends StatelessWidget {
  final String nameHotel;
  const NameOfHotel({
    super.key,
    required this.nameHotel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 8.0,
      ),
      child: BigText(text: nameHotel),
    );
  }
}
