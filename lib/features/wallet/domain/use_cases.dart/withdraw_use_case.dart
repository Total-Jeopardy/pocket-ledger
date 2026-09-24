import 'package:pocket_ledger/features/wallet/domain/repository/wallet_repository.dart';
import 'package:pocket_ledger/features/wallet/domain/withdraw_result.dart';

class WithdrawUseCase {
  WithdrawUseCase(this._walletRepository);

  final WalletRepository _walletRepository;

  Future<WithDrawResult> call(int amount) async {
    if (amount <= 0) {
      return const WithDrawFailure('Enter an amount greater than 0.');
    }

    final currentBalance = await _walletRepository.getBalance();

    if (amount > currentBalance) {
      return WithDrawFailure(
        'Insufficient funds - your balance is $currentBalance.',
      );
    }

    final newBalance = await _walletRepository.withdraw(amount);
    return WithDrawSuccess(newBalance);
  }
}
