import '../models/company_model.dart';
import '../models/worker_model.dart';

abstract class CompanyRepository {
  Future<Company?> getCompany(String companyId);
  Future<void> addWorker(String companyId, Worker worker);
}