abstract class WalletRepository {
  Future<int> getBalance();
  Future<void> deposit(int amount);
  Future<int> withdraw(int amount);
}
