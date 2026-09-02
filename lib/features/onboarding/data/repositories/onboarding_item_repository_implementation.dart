import 'package:pocket_ledger/features/onboarding/domain/repositories/onboarding_item_repository.dart';
import 'package:pocket_ledger/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:pocket_ledger/features/onboarding/domain/entities/onboarding_item.dart';

class OnboardingItemRepositoryImplementation
    implements OnboardingItemRepository {
  const OnboardingItemRepositoryImplementation(this.localDataSource);

  final OnboardingLocalDataSource localDataSource;

  @override
  List<OnboardingItem> getOnboardingItems() {
    return localDataSource.getOnboardingItems();
  }
}
