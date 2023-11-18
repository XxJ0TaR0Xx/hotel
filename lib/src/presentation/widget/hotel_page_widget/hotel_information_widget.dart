import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HotelInformation extends StatelessWidget {
  final String information;
  final String pathIcon;
  const HotelInformation({
    super.key,
    required this.information,
    required this.pathIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        bottom: 10.0,
        right: 15.0,
      ),
      child: Row(
        children: [
          SvgPicture.asset(pathIcon),
          const SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                information,
                style: const TextStyle(
                  color: Color(0xFF2C3035),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'Самое необходимое',
                style: TextStyle(
                  color: Color(0xFF828796),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(flex: 1),
          const Icon(
            Icons.arrow_forward_ios,
            size: 24.0,
          )
        ],
      ),
    );
  }
}
