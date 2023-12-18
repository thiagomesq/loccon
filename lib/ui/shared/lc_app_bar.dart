import 'package:flutter/material.dart';

class LCAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LCAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      elevation: 15,
      title: Image.asset(
        'assets/images/escrita.png',
        height: 40,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
