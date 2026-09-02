import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class OnboardingBalanceAlertIllustration extends StatelessWidget {
  const OnboardingBalanceAlertIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      padding: const EdgeInsets.all(AppSpacing.space5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1C2940), Color(0xFF1A182C)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 30,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Transform.rotate(
            angle: 0.04,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.space4),
              decoration: BoxDecoration(
                color: const Color(0xFF222F45),
                borderRadius: BorderRadius.circular(AppRadii.xl),
                border: Border.all(color: const Color(0xFF344159)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AVAILABLE BALANCE',
                    style: AppTypography.bodySm.copyWith(
                      color: AppColors.textSecondaryDark,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.7,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space2),
                  Text(
                    r'$142.50',
                    style: AppTypography.h2.copyWith(
                      color: AppColors.textPrimaryDark,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: List.generate(
                      4,
                      (index) => Container(
                        width: 42,
                        height: 30,
                        margin: const EdgeInsets.only(right: AppSpacing.space2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2C3850),
                          borderRadius: BorderRadius.circular(AppRadii.sm),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -2,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.space4,
                vertical: AppSpacing.space3,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFB80F18),
                borderRadius: BorderRadius.circular(AppRadii.pill),
                border: Border.all(color: const Color(0xFFEA3842)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFFF777D),
                  ),
                  const SizedBox(width: AppSpacing.space2),
                  Text(
                    'Low balance alert',
                    style: AppTypography.bodyMd.copyWith(
                      color: AppColors.textPrimaryDark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
