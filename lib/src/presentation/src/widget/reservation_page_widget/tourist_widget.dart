import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel/src/presentation/src/widget/big_text_widget.dart';
import 'package:hotel/src/presentation/src/widget/container_widget.dart';
import 'package:hotel/src/presentation/src/widget/reservation_page_widget/input_text_widget.dart';

class TouristWidget extends StatelessWidget {
  final String countTourist;
  final List<String> listAtributes;
  const TouristWidget({
    super.key,
    required this.listAtributes,
    required this.countTourist,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: MyContainer(
        widget: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            trailing: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset('assets/arrow_down.svg'),
            ),
            title: BigText(text: countTourist),
            iconColor: const Color(0xFF0D72FF),
            collapsedIconColor: const Color(0xFF0D72FF),
            childrenPadding: const EdgeInsets.only(
              top: 8.0,
              left: 16.0,
              right: 16.0,
            ),
            children: List.generate(
              listAtributes.length,
              (index) => InputText(lableText: listAtributes[index]),
            ),
          ),
        ),
      ),
    );
  }
}
