import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class TransactionSheetHeader extends StatelessWidget {
  const TransactionSheetHeader({
    super.key,
    required this.title,
    required this.onClose,
  });

  final String title;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 5,
          decoration: BoxDecoration(
            color: const Color(0xFF354159),
            borderRadius: BorderRadius.circular(AppRadii.pill),
          ),
        ),
        const SizedBox(height: AppSpacing.space5),
        Row(
          children: [
            Text(
              title,
              style: AppTypography.h2.copyWith(
                color: AppColors.textPrimaryDark,
              ),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Close',
              onPressed: onClose,
              icon: Icon(
                Icons.close_rounded,
                color: AppColors.textSecondaryDark,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
