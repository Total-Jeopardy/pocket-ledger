Future<int> initialAccountBalanceLoader() async {
  return await Future.delayed(Duration(seconds: 2), () {
    return 50;
  });
}
