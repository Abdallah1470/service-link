import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/worker_model.dart';

final workerProvider = StateNotifierProvider<WorkerNotifier, WorkerModel?>((ref) {
  return WorkerNotifier();
});

class WorkerNotifier extends StateNotifier<WorkerModel?> {
  WorkerNotifier() : super(null);

  void setWorker(WorkerModel worker) {
    state = worker;
  }
}
