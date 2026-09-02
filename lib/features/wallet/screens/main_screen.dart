import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/features/wallet/balance_providers.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/balance_card_widget.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/transaction_bottom_sheet.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/wallet_home/wallet_actions.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/wallet_home/wallet_header.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);

    return Scaffold(
      backgroundColor: AppColors.surfaceBgDark,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.space5,
            AppSpacing.space4,
            AppSpacing.space5,
            AppSpacing.space7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const WalletHeader(),
              const SizedBox(height: AppSpacing.space8),
              const BalanceCard(),
              const SizedBox(height: AppSpacing.space6),
              balance.when(
                data: (_) => WalletActions(
                  onDeposit: () => _showTransactionSheet(
                    context,
                    TransactionSheetType.deposit,
                  ),
                  onWithdraw: () => _showTransactionSheet(
                    context,
                    TransactionSheetType.withdraw,
                  ),
                ),
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.space5),
                    child: CircularProgressIndicator(
                      color: AppColors.brandPrimary,
                    ),
                  ),
                ),
                error: (error, stackTrace) =>
                    const Center(child: Text('Unable to load wallet actions.')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTransactionSheet(BuildContext context, TransactionSheetType type) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.72),
      builder: (context) => TransactionBottomSheet(type: type),
    );
  }
}
