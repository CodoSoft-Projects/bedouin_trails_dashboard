import '../enums/order_status.dart';
import 'trip/trip_model.dart';
import 'user_model.dart';

class OrderModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String description;
  final int numberOfAdults;
  final int numberOfChildren;
  final double totalPrice;
  final OrderStatus status;
  final String startDate;
  final String endDate;
  final UserModel user;
  final TripModel trip;

  const OrderModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.description,
    required this.numberOfAdults,
    required this.numberOfChildren,
    required this.totalPrice,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.user,
    required this.trip,
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
      totalPrice: (json['total_price'] ?? 0).toDouble(),
      status: OrderStatusExtension.fromString(json['status']),
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      user: UserModel.fromJson(json['user']),
      trip: TripModel.fromJson(json['trap']),
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
      'total_price': totalPrice,
      'status': status.toApi(),
      'start_date': startDate,
      'end_date': endDate,
      'user': user.toJson(),
      'trip': trip.toJson(),
    };
  }

  /// ================= EMPTY =================
  factory OrderModel.empty() {
    return OrderModel(
      id: 0,
      firstName: '',
      lastName: '',
      email: '',
      phone: '',
      description: '',
      numberOfAdults: 0,
      numberOfChildren: 0,
      totalPrice: 0,
      status: OrderStatus.pending,
      startDate: '',
      endDate: '',
      user: UserModel.empty(),
      trip: TripModel.empty(),
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
