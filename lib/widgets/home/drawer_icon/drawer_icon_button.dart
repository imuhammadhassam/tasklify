import 'package:flutter/material.dart';

class DrawerIconButton extends StatelessWidget {
  const DrawerIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.grid_view, color: Colors.white, size: 30),
        onPressed: () {
          Scaffold.of(context).openDrawer(); // ✅ Drawer open
        },
      ),
    );
  }
}
