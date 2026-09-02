import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class TransactionQuickAmountButton extends StatelessWidget {
  const TransactionQuickAmountButton({
    super.key,
    required this.label,
    required this.amount,
    required this.isSelected,
    required this.accent,
    required this.onTap,
  });

  final String label;
  final String amount;
  final bool isSelected;
  final Color accent;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(amount),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? accent.withValues(alpha: 0.14)
              : const Color(0xFF161F34),
          borderRadius: BorderRadius.circular(AppRadii.md),
          border: Border.all(
            color: isSelected ? accent : const Color(0xFF303B52),
          ),
        ),
        child: Text(
          label,
          style: AppTypography.bodyMd.copyWith(
            color: isSelected ? accent : AppColors.textPrimaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
