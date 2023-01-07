import 'package:flutter/material.dart';

class BlueCircle extends StatelessWidget {
  const BlueCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
    );
  }
}
