import 'package:pocket_ledger/features/onboarding/domain/entities/onboarding_item.dart';

abstract class OnboardingItemRepository {
  List<OnboardingItem> getOnboardingItems();
}
