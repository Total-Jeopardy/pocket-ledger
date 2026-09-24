enum AccountType { cash, bank, savings, creditCard, digitalWallet }

class Wallet {
  const Wallet({
    required this.id,
    required this.name,
    required this.balance,
    required this.accountType,
    required this.createdAt,
  });

  final String id;
  final String name;
  final int balance;
  final AccountType accountType;
  final DateTime createdAt;
}
