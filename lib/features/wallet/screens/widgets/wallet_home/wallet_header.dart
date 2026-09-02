import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: Icon(
              Icons.menu_rounded,
              color: AppColors.brandPrimary,
              size: 27,
            ),
          ),
        ),
        const Spacer(),
        Text(
          'PocketLedger',
          style: AppTypography.h3.copyWith(
            color: AppColors.brandPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        const SizedBox(
          width: 40,
          height: 40,
          child: Center(
            child: Icon(
              Icons.settings_outlined,
              color: AppColors.brandPrimary,
              size: 27,
            ),
          ),
        ),
      ],
    );
  }
}
