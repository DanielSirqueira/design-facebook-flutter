import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;

  const CircularButton({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.all(6),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
      ),
    );
  }
}
