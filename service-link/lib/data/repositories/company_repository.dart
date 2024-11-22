import '../models/company_model.dart';
import '../models/worker_model.dart';

abstract class CompanyRepository {
  Future<CompanyModel?> getCompany(String companyId);
  Future<void> addWorker(String companyId, WorkerModel worker);
}