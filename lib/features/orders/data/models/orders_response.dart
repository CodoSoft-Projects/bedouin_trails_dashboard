import '../../../../core/models/order_model.dart';

class OrdersResponseModel {
  final bool status;
  final String message;
  final List<OrderModel> orders;

  const OrdersResponseModel({
    required this.status,
    required this.message,
    required this.orders,
  });

  /// ================= FROM JSON =================
  factory OrdersResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return OrdersResponseModel.empty();

    final rawData = json['data'];

    List<OrderModel> parsedOrders = [];

    if (rawData is List) {
      parsedOrders = rawData
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>?))
          .toList();
    }

    return OrdersResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      orders: parsedOrders,
    );
  }

  /// ================= EMPTY =================
  factory OrdersResponseModel.empty() {
    return const OrdersResponseModel(status: false, message: '', orders: []);
  }

  /// ================= HELPERS =================
  bool get isEmpty => orders.isEmpty;
  bool get isNotEmpty => orders.isNotEmpty;
  int get length => orders.length;
}
