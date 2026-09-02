import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';
import 'package:pocket_ledger/features/onboarding/domain/entities/onboarding_item.dart';
import 'package:pocket_ledger/features/onboarding/presentation/widgets/onboarding_balance_alert_illustration.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.item});

  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const OnboardingBalanceAlertIllustration(),
        const SizedBox(height: AppSpacing.space7),
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: AppTypography.h1.copyWith(
            color: AppColors.textPrimaryDark,
            height: 1.1,
          ),
        ),
        const SizedBox(height: AppSpacing.space5),
        Text(
          item.description,
          textAlign: TextAlign.center,
          style: AppTypography.bodyLg.copyWith(
            color: AppColors.textSecondaryDark,
            height: 1.55,
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
