import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/faded_bar.dart';

class BalanceIllustration extends StatelessWidget {
  const BalanceIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadedBar(height: 46),
        const SizedBox(width: AppSpacing.space2),
        FadedBar(height: 32),
        const SizedBox(width: AppSpacing.space2),
        FadedBar(height: 56),
        const SizedBox(width: AppSpacing.space2),
        FadedBar(height: 38),
        const SizedBox(width: AppSpacing.space2),
        FadedBar(height: 65),
      ],
    );
  }
}
