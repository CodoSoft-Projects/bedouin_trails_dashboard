import 'package:flutter/material.dart';

import '../../../../core/enums/order_status.dart';
import '../../../../core/models/pagination_model.dart';
import '../../../../core/models/user_model.dart';
import '../../data/repos/orders_repo.dart';

class OrdesProvider extends ChangeNotifier {
  OrdersRepo repo = OrdersRepo();

  String message = '';
  List<UserModel> users = [];
  UserModel? selectedUser;
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

    final result = await repo.getAllOrdersUsers(
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
        users = model.users;
        pagination = model.pagination;
        checkGettingAllUser = true;
      },
    );
    notifyListeners();
  }

  void onSelectUser(UserModel user) {
    selectedUser = user;
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
