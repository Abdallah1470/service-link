abstract class RatingRepository {
  Future<void> rateWorker(String workerId, String raterId, double rating, String review);
  Future<double> getUpdatedRating(String workerId);
}
