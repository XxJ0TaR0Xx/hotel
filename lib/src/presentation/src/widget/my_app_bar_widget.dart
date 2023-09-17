import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String pathIcon;
  const MyAppBar({
    super.key,
    required this.text,
    this.pathIcon = '',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          pathIcon,
        ),
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
