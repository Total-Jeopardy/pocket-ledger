import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/features/wallet/balance_notifier.dart';
import 'package:pocket_ledger/features/wallet/balance_providers.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/transaction_sheet/transaction_amount_panel.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/transaction_sheet/transaction_confirm_control.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/transaction_sheet/transaction_quick_amounts.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/transaction_sheet/transaction_sheet_header.dart';
import 'package:pocket_ledger/features/wallet/screens/widgets/transaction_sheet/transaction_validation_notice.dart';

enum TransactionSheetType { deposit, withdraw }

class TransactionBottomSheet extends ConsumerStatefulWidget {
  const TransactionBottomSheet({super.key, required this.type});

  final TransactionSheetType type;

  @override
  ConsumerState<TransactionBottomSheet> createState() =>
      _TransactionBottomSheetState();
}

class _TransactionBottomSheetState
    extends ConsumerState<TransactionBottomSheet> {
  late final TextEditingController _amountController;
  String? _validationMessage;
  String? _selectedAmount;

  bool get _isWithdrawal => widget.type == TransactionSheetType.withdraw;

  String get _title => _isWithdrawal ? 'Withdraw' : 'Deposit';

  Color get _accent =>
      _isWithdrawal ? const Color(0xFFFF4D55) : AppColors.brandPrimary;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _selectQuickAmount(String amount) {
    _amountController.value = TextEditingValue(
      text: amount,
      selection: TextSelection.collapsed(offset: amount.length),
    );
    setState(() {
      _selectedAmount = amount;
      _validationMessage = null;
    });
  }

  void _handleTextChange(String value) {
    setState(() {
      _selectedAmount = null;
      _validationMessage = null;
    });
  }

  int? _readAmount() {
    final amount = double.tryParse(_amountController.text.trim());
    if (amount == null || amount <= 0 || amount != amount.roundToDouble()) {
      return null;
    }
    return amount.toInt();
  }

  void _confirm() {
    final amount = _readAmount();
    if (amount == null) {
      setState(() {
        _validationMessage = 'Enter a whole-dollar amount greater than \$0.00.';
      });
      return;
    }

    if (_isWithdrawal) {
      final result = ref.read(balanceProvider.notifier).withdraw(amount);
      if (result is WithDrawFailure) {
        setState(() => _validationMessage = result.errorMessage);
        return;
      }
    } else {
      ref.read(balanceProvider.notifier).deposit(amount);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF202C41),
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.space5,
              AppSpacing.space2,
              AppSpacing.space5,
              AppSpacing.space6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TransactionSheetHeader(
                  title: _title,
                  onClose: () => Navigator.of(context).pop(),
                ),
                const SizedBox(height: AppSpacing.space5),
                TransactionAmountPanel(
                  controller: _amountController,
                  accent: _accent,
                  onChanged: _handleTextChange,
                ),
                if (_validationMessage != null) ...[
                  const SizedBox(height: AppSpacing.space4),
                  TransactionValidationNotice(message: _validationMessage!),
                ],
                const SizedBox(height: AppSpacing.space5),
                TransactionQuickAmounts(
                  selectedAmount: _selectedAmount,
                  accent: _accent,
                  onSelected: _selectQuickAmount,
                ),
                const SizedBox(height: AppSpacing.space6),
                TransactionConfirmControl(
                  title: _title,
                  accent: _accent,
                  onTap: _confirm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
