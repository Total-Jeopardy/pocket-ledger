import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class TransactionConfirmControl extends StatelessWidget {
  const TransactionConfirmControl({
    super.key,
    required this.title,
    required this.accent,
    required this.onTap,
  });

  final String title;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDeposit = title == 'Deposit';
    final foreground = isDeposit ? AppColors.surfaceBgDark : accent;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 68,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDeposit ? AppColors.brandPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadii.lg),
          border: isDeposit ? null : Border.all(color: accent),
          boxShadow: isDeposit
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
            Icon(
              isDeposit ? Icons.south_rounded : Icons.lock_outline,
              color: foreground,
            ),
            const SizedBox(width: AppSpacing.space2),
            Text(
              'CONFIRM ${title.toUpperCase()}',
              style: AppTypography.bodyMd.copyWith(
                color: foreground,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
