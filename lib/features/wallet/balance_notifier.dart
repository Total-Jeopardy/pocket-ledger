import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_ledger/features/wallet/data/data_sources/fake_server.dart';

class BalanceNotifier extends AsyncNotifier<int> {
  @override
  Future<int> build() {
    return initialAccountBalanceLoader(); // Initial balance is set to the value returned by the loader
  }

  WithDrawResult withdraw(int amount) {
    final currentBalance = state.when(
      data: (balance) => balance,
      loading: () => null,
      error: (error, stackTrace) => null,
    );

    if (currentBalance == null) {
      return const WithDrawFailure('Balance is not available yet.');
    }

    if (amount <= 0) {
      return const WithDrawFailure('Enter an amount greater than \$0.00.');
    }

    if (amount > currentBalance) {
      return WithDrawFailure(
        'Insufficient funds - your balance is '
        '\$${currentBalance.toStringAsFixed(2)}.',
      );
    }

    final newBalance = currentBalance - amount;
    state = AsyncValue.data(newBalance);
    return WithDrawSuccess(newBalance);
  }

  void deposit(int amount) {
    final currentBalance = state.when(
      data: (balance) => balance,
      loading: () => null,
      error: (error, stackTrace) => null,
    );
    if (currentBalance == null || amount <= 0) {
      return;
    }

    state = AsyncValue.data(currentBalance + amount);
  }
}

sealed class WithDrawResult {
  const WithDrawResult();
}

final class WithDrawSuccess extends WithDrawResult {
  const WithDrawSuccess(this.newBalance);

  final int newBalance;
}

final class WithDrawFailure extends WithDrawResult {
  const WithDrawFailure(this.errorMessage);

  final String errorMessage;
}
