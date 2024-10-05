import '../models/worker_model.dart';

abstract class WorkerRepository {
  Future<Worker?> getWorker(String workerId);
}