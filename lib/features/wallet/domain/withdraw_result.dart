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
