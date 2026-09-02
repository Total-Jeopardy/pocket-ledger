import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class TransactionAmountPanel extends StatelessWidget {
  const TransactionAmountPanel({
    super.key,
    required this.controller,
    required this.accent,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Color accent;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 208,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space5),
      decoration: BoxDecoration(
        color: const Color(0xFF141D31),
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: const Color(0xFF303B52)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                r'$',
                style: AppTypography.h1.copyWith(
                  color: AppColors.textSecondaryDark,
                  fontSize: 52,
                ),
              ),
              const SizedBox(width: AppSpacing.space3),
              SizedBox(
                width: 220,
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\.?\d{0,2}'),
                    ),
                  ],
                  textAlign: TextAlign.center,
                  style: AppTypography.h1.copyWith(
                    color: AppColors.textPrimaryDark,
                    fontSize: 52,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '0.00',
                    hintStyle: AppTypography.h1.copyWith(
                      color: const Color(0xFF5D6980),
                      fontSize: 52,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space2),
          Container(width: 160, height: 3, color: accent),
        ],
      ),
    );
  }
}
