import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: Colors.lightBlue,
      constraints: const BoxConstraints.tightFor(width: 40, height: 40),
    );
  }
}
