import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_ledger/core/design_system/app_colors.dart';
import 'package:pocket_ledger/core/design_system/app_radii.dart';
import 'package:pocket_ledger/core/design_system/app_spacing.dart';
import 'package:pocket_ledger/core/design_system/app_typography.dart';
import 'package:pocket_ledger/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:pocket_ledger/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:pocket_ledger/features/onboarding/providers/providers.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _finishOnboarding() {
    Navigator.of(context).pushReplacementNamed('/get-started');
  }

  void _nextPage(int currentPage, int itemCount) {
    if (currentPage == itemCount - 1) {
      _finishOnboarding();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final onboardingItemUseCase = ref.watch(onboardingItemUseCaseProvider);
    final onboardingItems = onboardingItemUseCase();
    final currentPage = ref.watch(onboardingPageIndexProvider);

    return Scaffold(
      backgroundColor: AppColors.surfaceBgDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.space5,
            AppSpacing.space2,
            AppSpacing.space5,
            AppSpacing.space5,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _finishOnboarding,
                  child: Text(
                    'Skip',
                    style: AppTypography.bodyLg.copyWith(
                      color: AppColors.textSecondaryDark,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingItems.length,
                  onPageChanged: (index) {
                    ref
                        .read(onboardingPageIndexProvider.notifier)
                        .setPage(index);
                  },
                  itemBuilder: (context, index) =>
                      OnboardingPage(item: onboardingItems[index]),
                ),
              ),
              OnboardingPageIndicator(
                itemCount: onboardingItems.length,
                currentPage: currentPage,
              ),
              const SizedBox(height: AppSpacing.space5),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: FilledButton(
                  onPressed: () =>
                      _nextPage(currentPage, onboardingItems.length),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.brandPrimary,
                    foregroundColor: AppColors.surfaceBgDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadii.xl),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentPage == onboardingItems.length - 1
                            ? 'Get started'
                            : 'Next',
                        style: AppTypography.bodyLg.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.space2),
                      const Icon(Icons.arrow_forward_rounded),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
