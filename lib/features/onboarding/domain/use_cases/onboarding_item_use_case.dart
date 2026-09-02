import 'package:pocket_ledger/features/onboarding/domain/entities/onboarding_item.dart';
import 'package:pocket_ledger/features/onboarding/domain/repositories/onboarding_item_repository.dart';

class OnboardingItemUseCase {
  const OnboardingItemUseCase(this._repository);

  final OnboardingItemRepository _repository;

  List<OnboardingItem> call() {
    return _repository.getOnboardingItems();
  }
}
