import 'package:flutter/material.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboardingScreen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBgDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.surfaceBgLight,
              ),
              child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
            ),
            const SizedBox(height: 10),
            Text(
              'Pocket Ledger',
              style: AppTypography.bodyLg.copyWith(
                color: AppColors.surfaceBgLight,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Trust through Clarity',
              style: AppTypography.bodyMd.copyWith(
                color: const Color.fromARGB(255, 82, 93, 109),
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.surfaceBgLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
