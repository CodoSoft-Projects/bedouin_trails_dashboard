import '../../../../core/models/order_model.dart';
import '../../../../core/models/pagination_model.dart';

class OrdersResponseModel {
  final bool status;
  final String message;
  final List<OrderModel> orders;
  final PaginationModel pagination;

  const OrdersResponseModel({
    required this.status,
    required this.message,
    required this.orders,
    required this.pagination,
  });

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
      pagination: PaginationModel.fromJson(json['pagination']),
    );
  }

  factory OrdersResponseModel.empty() {
    return OrdersResponseModel(
      status: false,
      message: '',
      orders: [],
      pagination: PaginationModel.empty(),
    );
  }

  bool get isEmpty => orders.isEmpty;
  bool get isNotEmpty => orders.isNotEmpty;
}
