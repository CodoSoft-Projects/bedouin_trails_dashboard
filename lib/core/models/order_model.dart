import '../enums/order_status.dart';

class OrderModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String description;
  final int numberOfAdults;
  final int numberOfChildren;
  final OrderStatus status;
  final String startDate;
  final String endDate;

  const OrderModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.description,
    required this.numberOfAdults,
    required this.numberOfChildren,
    required this.status,
    required this.startDate,
    required this.endDate,
  });

  /// ================= FROM JSON =================
  factory OrderModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return OrderModel.empty();

    return OrderModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      description: json['description'] ?? '',
      numberOfAdults: json['number_of_adults'] ?? 0,
      numberOfChildren: json['number_of_children'] ?? 0,
      status: OrderStatusExtension.fromString(json['status']),
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
    );
  }

  /// ================= TO JSON =================
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'description': description,
      'number_of_adults': numberOfAdults,
      'number_of_children': numberOfChildren,
      'status': status.toApi(),
      'start_date': startDate,
      'end_date': endDate,
    };
  }

  /// ================= EMPTY =================
  factory OrderModel.empty() {
    return const OrderModel(
      id: 0,
      firstName: '',
      lastName: '',
      email: '',
      phone: '',
      description: '',
      numberOfAdults: 0,
      numberOfChildren: 0,
      status: OrderStatus.pending,
      startDate: '',
      endDate: '',
    );
  }

  /// ================= COPY WITH =================
  OrderModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? description,
    int? numberOfAdults,
    int? numberOfChildren,
    OrderStatus? status,
    String? startDate,
    String? endDate,
  }) {
    return OrderModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      description: description ?? this.description,
      numberOfAdults: numberOfAdults ?? this.numberOfAdults,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  /// ================= EQUALITY =================
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
