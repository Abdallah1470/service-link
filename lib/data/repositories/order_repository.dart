import '../models/order_model.dart';

abstract class OrderRepository {
  Future<void> addOrder(String userId, Order order);
  Future<List<Order>> getOrders(String userId);
  Future<void> updateOrder(String userId, Order order);
  Future<void> deleteOrder(String userId, String orderId);
}