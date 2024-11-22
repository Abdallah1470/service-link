import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/company_model.dart';
import '../data/models/worker_model.dart';
import '../data/repositories/providers.dart';

class CompanyViewModel extends StateNotifier<CompanyModel?> {
  final Ref ref;

  CompanyViewModel(this.ref) : super(null);

  Future<void> fetchCompany(String companyId) async {
    final companyData = await ref.read(companyRepositoryProvider).getCompany(companyId);
    state = companyData;
  }

  Future<void> addWorkerToCompany(WorkerModel worker) async {
    if (state != null) {
      await ref.read(companyRepositoryProvider).addWorker(state!.id, worker);
      state = state!.copyWithCompany(employees: [...state!.employees, worker]);
    }
  }
}

final companyViewModelProvider = StateNotifierProvider<CompanyViewModel, CompanyModel?>((ref) {
  return CompanyViewModel(ref);
});
