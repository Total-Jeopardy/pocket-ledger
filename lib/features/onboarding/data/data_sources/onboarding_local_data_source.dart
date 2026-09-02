import 'package:pocket_ledger/features/onboarding/domain/entities/onboarding_item.dart';

final List<OnboardingItem> _onboardingItems = [
  const OnboardingItem(
    title: 'Welcome to Pocket Ledger',
    description:
        'PocketLedger keeps a simple, honest record of what you have — no surprises.',
    imagePath: 'assets/images/onboarding1.png',
  ),
  const OnboardingItem(
    title: "Know before it's a problem.",
    description:
        "A live low-balance warning appears the moment your funds dip below a safe threshold.",
    imagePath: 'assets/images/onboarding2.png',
  ),
  const OnboardingItem(
    title: "You can't overdraw.",
    description:
        "Every withdrawal is checked first. If it would take you below zero, we stop it and tell you why.",
    imagePath: 'assets/images/onboarding3.png',
  ),
];

class OnboardingLocalDataSource {
  List<OnboardingItem> getOnboardingItems() {
    return _onboardingItems;
  }
}
