import 'package:pocket_ledger/features/wallet/domain/repository/wallet_repository.dart';

class DepositUseCase {
  DepositUseCase(this._walletRepository);

  final WalletRepository _walletRepository;

  Future<void> call(int amount) {
    return _walletRepository.deposit(amount);
  }
}
