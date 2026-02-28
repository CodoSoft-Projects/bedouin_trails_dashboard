import 'package:flutter/material.dart';

import '../../../../core/enums/order_status.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/models/pagination_model.dart';
import '../../data/repos/orders_repo.dart';

class OrdersProvider extends ChangeNotifier {
  OrdersRepo repo = OrdersRepo();

  String message = '';
  List<OrderModel> orders = [];
  OrderModel? selectedOrder;
  PaginationModel pagination = PaginationModel.empty();
  var searchController = TextEditingController();

  List<OrderStatus> orderStatuses = OrderStatus.values.toList();
  OrderStatus orderStatus = OrderStatus.pending;


  void onChangeOrderStatus(int idx) {
    orderStatus = orderStatuses[idx];
    getAllOrdersUsers();
  }

  /// Get All Orders Users
  bool? checkGettingAllUser = false;
  Future<void> getAllOrdersUsers({int page = 1}) async {
    checkGettingAllUser = null;
    notifyListeners();

    final result = await repo.getAllOrders(
      search: searchController.text,
      page: page,
      status: orderStatus,
    );
    result.fold(
      (msg) {
        message = msg;
        checkGettingAllUser = false;
      },
      (model) {
        message = model.message;
        orders = model.orders;
        pagination = model.pagination;
        checkGettingAllUser = true;
      },
    );
    notifyListeners();
  }

  void onSelectUser(OrderModel user) {
    selectedOrder = user;
    notifyListeners();
  }

  /// Update order status
  bool? checkUpdatingOrderStatus = false;
  Future<void> updateOrderStatus({
    required int id,
    required OrderStatus status,
  }) async {
    checkUpdatingOrderStatus = null;
    notifyListeners();

    final result = await repo.updateOrderStatus(id: id, status: status);
    result.fold(
      (msg) {
        message = msg;
        checkUpdatingOrderStatus = false;
      },
      (model) {
        message = model.message;
        checkUpdatingOrderStatus = true;
        getAllOrdersUsers();
      },
    );
    notifyListeners();
  }
}
