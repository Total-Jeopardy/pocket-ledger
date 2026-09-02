import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_ledger/features/wallet/fake_server.dart';

final initialBalanceProvider = FutureProvider<int>((ref) async {
  return await initialAccountBalanceLoader();
});
