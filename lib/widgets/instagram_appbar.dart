import 'package:flutter/material.dart';

class InstagramAppBar extends StatelessWidget
    implements PreferredSizeWidget {

  const InstagramAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,

      title: const Text(
        "Instagram",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 1,
        ),
      ),

      actions: const [

        Icon(
          Icons.favorite_border,
          color: Colors.black,
          size: 26,
        ),

        SizedBox(width: 20),

        Icon(
          Icons.send_outlined,
          color: Colors.black,
          size: 26,
        ),

        SizedBox(width: 12),
      ],

      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          height: 1,
          color: Color(0xFFE0E0E0),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}