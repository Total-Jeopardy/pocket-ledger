import 'package:pocket_ledger/features/wallet/domain/repository/wallet_repository.dart';
import 'package:pocket_ledger/features/wallet/data/data_sources/fake_server.dart';

class WalletRepositoryImplementation implements WalletRepository {
  WalletRepositoryImplementation(this._remoteSource);

  final WalletRemoteSource _remoteSource;

  @override
  Future<void> deposit(int amount) {
    return _remoteSource.deposit(amount);
  }

  @override
  Future<int> getBalance() {
    return _remoteSource.getBalance();
  }

  @override
  Future<int> withdraw(int amount) {
    return _remoteSource.withdraw(amount);
  }
}
