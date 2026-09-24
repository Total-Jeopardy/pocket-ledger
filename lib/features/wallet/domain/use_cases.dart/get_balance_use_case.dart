import 'package:pocket_ledger/features/wallet/domain/repository/wallet_repository.dart';

class GetBalanceUseCase {
  GetBalanceUseCase(this._repository);

  final WalletRepository _repository;

  Future<int> call() {
    return _repository.getBalance();
  }
}
