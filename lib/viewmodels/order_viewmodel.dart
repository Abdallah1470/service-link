import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/order_model.dart';
import '../data/repositories/order_repository.dart';
import '../data/repositories/providers.dart';

class OrderState {
  final List<Order> orders;
  final bool isLoading;
  final String? errorMessage;

  OrderState({
    this.orders = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  OrderState copyWith({
    List<Order>? orders,
    bool? isLoading,
    String? errorMessage,
  }) {
    return OrderState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class OrderViewModel extends StateNotifier<OrderState> {
  final OrderRepository _orderRepository;
  final String userId;

  OrderViewModel(this._orderRepository, this.userId) : super(OrderState());

  Future<void> fetchOrders() async {
    state = state.copyWith(isLoading: true);
    try {
      List<Order> orders = await _orderRepository.getOrders(userId);
      state = state.copyWith(orders: orders, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> addOrder(Order order) async {
    state = state.copyWith(isLoading: true);
    try {
      await _orderRepository.addOrder(userId, order);
      await fetchOrders();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> updateOrder(Order order) async {
    state = state.copyWith(isLoading: true);
    try {
      await _orderRepository.updateOrder(userId, order);
      await fetchOrders();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> deleteOrder(String orderId) async {
    state = state.copyWith(isLoading: true);
    try {
      await _orderRepository.deleteOrder(userId, orderId);
      await fetchOrders();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }
}

final orderViewModelProvider = StateNotifierProvider.family<OrderViewModel, OrderState, String>(
      (ref, userId) => OrderViewModel(ref.read(orderRepositoryProvider), userId),
);
