import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';

class FadedBar extends StatelessWidget {
  const FadedBar({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF2A3950),
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
    );
  }
}
