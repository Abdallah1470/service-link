import '../models/order_model.dart';

abstract class OrderRepository {
  Future<void> addOrder(String userId, OrderModel order);
  Future<List<OrderModel>> getOrders(String userId);
  Future<void> updateOrder(String userId, OrderModel order);
  Future<void> deleteOrder(String userId, String orderId);
}