import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';
import 'package:pocket_ledger/features/wallet/balance_providers.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/balance_illustration_card.dart';

class BalanceCard extends ConsumerWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formattedBalance = ref.watch(formattedBalanceProvider);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.space5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadii.xl),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF17253A), Color(0xFF101B2E)],
        ),
        border: Border.all(color: const Color(0xFF27364D)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 26,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'BALANCE',
            style: AppTypography.bodyMd.copyWith(
              color: AppColors.brandPrimary,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.7,
            ),
          ),
          const SizedBox(height: AppSpacing.space3),
          Text(
            formattedBalance,
            style: AppTypography.h1.copyWith(
              color: AppColors.textPrimaryDark,
              fontSize: 42,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.space4),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space3,
              vertical: AppSpacing.space2,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF2B202B),
              borderRadius: BorderRadius.circular(AppRadii.pill),
              border: Border.all(color: const Color(0xFF71333D)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  color: Color(0xFFFF5D67),
                  size: 18,
                ),
                const SizedBox(width: AppSpacing.space2),
                Text(
                  'Low balance',
                  style: AppTypography.bodySm.copyWith(
                    color: const Color(0xFFFF5D67),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space7),
          const BalanceIllustration(),
        ],
      ),
    );
  }
}
