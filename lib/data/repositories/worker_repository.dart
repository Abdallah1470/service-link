import '../models/worker_model.dart';

abstract class WorkerRepository {
  Future<WorkerModel?> getWorker(String workerId);
}