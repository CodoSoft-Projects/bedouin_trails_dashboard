import '../../../../core/models/account_model.dart';

class AuthModel {
  final bool status;
  final String message;
  final AccountModel account;

  const AuthModel({
    required this.status,
    required this.message,
    required this.account,
  });

  /// ================= FROM JSON =================
  factory AuthModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return AuthModel.empty();

    return AuthModel(
      status: _asBool(json['status']),
      message: _asString(json['message']),
      account: AccountModel.fromJson(json['data']),
    );
  }

  /// ================= EMPTY =================
  factory AuthModel.empty() {
    return AuthModel(
      status: false,
      message: '',
      account: AccountModel.empty(),
    );
  }

  /// ================= TO JSON =================
  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": account.toJson(),
    };
  }

  /// ================= HELPERS =================

  bool get isSuccess => status;

  bool get isFailure => !status;

  bool get isLoggedIn => account.token.isNotEmpty;

  /// ================= SAFE PARSERS =================

  static String _asString(dynamic value, [String defaultValue = '']) {
    if (value == null) return defaultValue;
    return value.toString();
  }

  static bool _asBool(dynamic value, [bool defaultValue = false]) {
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) {
      final v = value.toLowerCase();
      return v == 'true' || v == '1';
    }
    return defaultValue;
  }
}
