import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/wallet_home/wallet_action_button.dart';

class WalletActions extends StatelessWidget {
  const WalletActions({
    super.key,
    required this.onDeposit,
    required this.onWithdraw,
  });

  final VoidCallback onDeposit;
  final VoidCallback onWithdraw;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'WALLET ACTIONS',
          style: AppTypography.bodySm.copyWith(
            color: AppColors.textSecondaryDark,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: AppSpacing.space3),
        WalletActionButton(
          label: 'Deposit',
          icon: Icons.south_rounded,
          isPrimary: true,
          onTap: onDeposit,
        ),
        const SizedBox(height: AppSpacing.space3),
        WalletActionButton(
          label: 'Withdraw',
          icon: Icons.north_rounded,
          onTap: onWithdraw,
        ),
      ],
    );
  }
}
