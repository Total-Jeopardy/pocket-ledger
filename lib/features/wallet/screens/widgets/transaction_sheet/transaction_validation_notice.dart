import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class TransactionValidationNotice extends StatelessWidget {
  const TransactionValidationNotice({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space4),
      decoration: BoxDecoration(
        color: const Color(0xFF392330),
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: const Color(0xFF90333E)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Color(0xFFFF4D55),
            size: 27,
          ),
          const SizedBox(width: AppSpacing.space3),
          Expanded(
            child: Text(
              message,
              style: AppTypography.bodyMd.copyWith(
                color: const Color(0xFFFFD9DB),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
