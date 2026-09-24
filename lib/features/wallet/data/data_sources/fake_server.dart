class WalletRemoteSource {
  int _balance = 0;

  Future<void> deposit(int amount) async {
    await Future.delayed(Duration(seconds: 1));
    _balance += amount;
  }

  Future<int> withdraw(int amount) async {
    await Future.delayed(Duration(seconds: 1));

    _balance -= amount;
    return _balance;
  }

  Future<int> getBalance() async {
    await Future.delayed(Duration(seconds: 1));
    return _balance;
  }
}
