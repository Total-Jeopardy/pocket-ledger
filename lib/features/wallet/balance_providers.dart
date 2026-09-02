import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_ledger/features/wallet/balance_notifier.dart';

final balanceProvider = AsyncNotifierProvider<BalanceNotifier, int>(
  BalanceNotifier.new,
);

final formattedBalanceProvider = Provider<String>((ref) {
  final balanceAsyncValue = ref.watch(balanceProvider);

  return balanceAsyncValue.when(
    data: (balance) => '\$${balance.toStringAsFixed(2)}',
    loading: () => 'Loading...',
    error: (error, stackTrace) => 'Error loading balance',
  );
});
