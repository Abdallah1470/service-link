import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/worker_model.dart';
import '../data/repositories/providers.dart';

class WorkerViewModel extends StateNotifier<WorkerModel?> {
  final Ref ref;

  WorkerViewModel(this.ref) : super(null);

  Future<void> fetchWorker(String userId) async {
    final workerData = await ref.read(workerRepositoryProvider).getWorker(userId);
    state = workerData;
  }

  Future<void> rateWorker(String workerId, String raterId, double rating, String review) async {
    await ref.read(ratingRepositoryProvider).rateWorker(workerId, raterId, rating, review);
    // Update worker's rating locally
    if (state != null) {
      double newRating = await ref.read(workerRepositoryProvider).getWorker(workerId).then((worker) => worker!.averageRating);
      state = state!.copyWithWorker(averageRating: newRating);
    }
  }
}

final workerViewModelProvider = StateNotifierProvider<WorkerViewModel, WorkerModel?>((ref) {
  return WorkerViewModel(ref);
});