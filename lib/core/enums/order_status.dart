// pending || accepted || payed || cancelled
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

enum OrderStatus {
  pending, // حجوزات معلقة
  accepted, // حجوزات مكتملة
  payed, // حجوزات مدفوعة
  cancelled, // حجوزات ملغاة
}

extension OrderStatusExtension on OrderStatus {
  /// ===============================
  /// Convert API string -> Enum
  /// ===============================
  static OrderStatus fromString(String? status) {
    switch (status?.toLowerCase()) {
      case 'accepted':
        return OrderStatus.accepted;
      case 'payed':
        return OrderStatus.payed;
      case 'cancelled':
        return OrderStatus.cancelled;
      case 'pending':
      default:
        return OrderStatus.pending;
    }
  }

  /// ===============================
  /// Convert Enum -> API string
  /// ===============================
  String toApi() {
    switch (this) {
      case OrderStatus.pending:
        return 'pending';
      case OrderStatus.accepted:
        return 'accepted';
      case OrderStatus.payed:
        return 'payed';
      case OrderStatus.cancelled:
        return 'cancelled';
    }
  }

  /// ===============================
  /// UI Label (Localization)
  /// ===============================
  String label(BuildContext context) {
    switch (this) {
      case OrderStatus.pending:
        return S.of(context).order_pending;
      case OrderStatus.accepted:
        return S.of(context).order_accepted;
      case OrderStatus.payed:
        return S.of(context).order_payed;
      case OrderStatus.cancelled:
        return S.of(context).order_cancelled;
    }
  }
}
