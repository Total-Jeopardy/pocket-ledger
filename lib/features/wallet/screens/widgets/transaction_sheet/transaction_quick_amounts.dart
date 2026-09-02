import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/transaction_sheet/transaction_quick_amount_button.dart';

class TransactionQuickAmounts extends StatelessWidget {
  const TransactionQuickAmounts({
    super.key,
    required this.selectedAmount,
    required this.accent,
    required this.onSelected,
  });

  final String? selectedAmount;
  final Color accent;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'QUICK AMOUNT',
          style: AppTypography.bodySm.copyWith(
            color: AppColors.textSecondaryDark,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: AppSpacing.space3),
        Row(
          children: [
            Expanded(
              child: TransactionQuickAmountButton(
                label: r'$20',
                amount: '20.00',
                isSelected: selectedAmount == '20.00',
                accent: accent,
                onTap: onSelected,
              ),
            ),
            const SizedBox(width: AppSpacing.space3),
            Expanded(
              child: TransactionQuickAmountButton(
                label: r'$50',
                amount: '50.00',
                isSelected: selectedAmount == '50.00',
                accent: accent,
                onTap: onSelected,
              ),
            ),
            const SizedBox(width: AppSpacing.space3),
            Expanded(
              child: TransactionQuickAmountButton(
                label: r'$100',
                amount: '100.00',
                isSelected: selectedAmount == '100.00',
                accent: accent,
                onTap: onSelected,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
