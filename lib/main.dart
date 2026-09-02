import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_ledger/features/wallet/screens/main_screen.dart';
import 'package:pocket_ledger/features/onboarding/presentation/get_started_screen.dart';
import 'package:pocket_ledger/features/onboarding/presentation/onboarding_screen.dart';
import 'package:pocket_ledger/features/onboarding/presentation/splash_screen.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      routes: {
        '/onboardingScreen': (context) => const OnboardingScreen(),
        '/get-started': (context) => const GetStartedScreen(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
