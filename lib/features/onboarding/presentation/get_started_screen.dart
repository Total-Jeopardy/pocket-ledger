import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBgDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Container(
                width: 112,
                height: 112,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.brandPrimary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: AppColors.surfaceBgDark,
                  size: 56,
                ),
              ),
              const SizedBox(height: AppSpacing.space6),
              Text(
                'Ready for clarity?',
                textAlign: TextAlign.center,
                style: AppTypography.h1.copyWith(
                  color: AppColors.textPrimaryDark,
                ),
              ),
              const SizedBox(height: AppSpacing.space4),
              Text(
                'Your pocket ledger is ready to help you stay ahead of every cedi.',
                textAlign: TextAlign.center,
                style: AppTypography.bodyLg.copyWith(
                  color: AppColors.textSecondaryDark,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 60,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/main');
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.brandPrimary,
                    foregroundColor: AppColors.surfaceBgDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadii.xl),
                    ),
                  ),
                  child: Text(
                    'Get started',
                    style: AppTypography.bodyLg.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
