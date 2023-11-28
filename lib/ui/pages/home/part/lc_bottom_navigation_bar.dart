import 'package:flutter/material.dart';

class LCBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;
  final List<BottomNavigationBarItem> items;
  const LCBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
      showUnselectedLabels: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      elevation: 15,
    );
  }
}
