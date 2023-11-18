import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel/src/presentation/widget/common_widgets/big_text_widget.dart';

class AddTourist extends StatelessWidget {
  final String text;
  final Function function;
  const AddTourist({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BigText(text: text),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: () {
              function();
            },
            icon: SvgPicture.asset('assets/icon_add.svg'),
          ),
        ),
      ],
    );
  }
}
