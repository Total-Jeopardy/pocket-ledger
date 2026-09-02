import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class WalletActionButton extends StatelessWidget {
  const WalletActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.isPrimary = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final foreground = isPrimary
        ? AppColors.surfaceBgDark
        : AppColors.textPrimaryDark;

    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isPrimary ? AppColors.brandPrimary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadii.lg),
            border: isPrimary
                ? null
                : Border.all(color: const Color(0xFF91A1B9), width: 1.2),
            boxShadow: isPrimary
                ? const [
                    BoxShadow(
                      color: Color(0x4422C55E),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: foreground, size: 25),
              const SizedBox(width: AppSpacing.space3),
              Text(
                label,
                style: AppTypography.bodyLg.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
