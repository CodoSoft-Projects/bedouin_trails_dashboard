import '../../../../core/models/order_model.dart';

class OrderResponseModel {
  final bool status;
  final String message;
  final OrderModel order;

  const OrderResponseModel({
    required this.status,
    required this.message,
    required this.order,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return OrderResponseModel.empty();

    return OrderResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      order: OrderModel.fromJson(json['data']),
    );
  }

  factory OrderResponseModel.empty() {
    return OrderResponseModel(
      status: false,
      message: '',
      order: OrderModel.empty(),
    );
  }
}
