import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_ledger/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:pocket_ledger/features/onboarding/data/repositories/onboarding_item_repository_implementation.dart';
import 'package:pocket_ledger/features/onboarding/domain/use_cases/onboarding_item_use_case.dart';

final localDataSourceProvider = Provider<OnboardingLocalDataSource>((ref) {
  return OnboardingLocalDataSource();
});

final repositoryProvider = Provider<OnboardingItemRepositoryImplementation>((
  ref,
) {
  final localDataSource = ref.watch(localDataSourceProvider);
  return OnboardingItemRepositoryImplementation(localDataSource);
});

final onboardingItemUseCaseProvider = Provider<OnboardingItemUseCase>((ref) {
  final repository = ref.watch(repositoryProvider);
  return OnboardingItemUseCase(repository);
});

final onboardingPageIndexProvider =
    NotifierProvider<OnboardingPageIndexNotifier, int>(
      OnboardingPageIndexNotifier.new,
    );

class OnboardingPageIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setPage(int page) {
    state = page;
  }
}
