import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({
    super.key,
    required this.itemCount,
    required this.currentPage,
  });

  final int itemCount;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          width: isActive ? 34 : 12,
          height: 12,
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.space1),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.brandPrimary
                : AppColors.semanticHighlightDark,
            borderRadius: BorderRadius.circular(AppRadii.pill),
          ),
        );
      }),
    );
  }
}
