import 'permissions_model.dart';

class AccountModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String image;
  final int otp;
  final String role;
  final PermissionsModel permissions;
  final String token;

  const AccountModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.image,
    required this.otp,
    required this.role,
    required this.permissions,
    required this.token,
  });

  /// ================= FROM JSON =================
  factory AccountModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return AccountModel.empty();
    }

    return AccountModel(
      id: _asInt(json['id']),
      firstName: _asString(json['first_name']),
      lastName: _asString(json['last_name']),
      email: _asString(json['email']),
      phone: _asString(json['phone']),
      image: _asString(json['image']),
      otp: _asInt(json['otp']),
      role: _asString(json['role']),
      permissions: json['permission'] ?? PermissionsModel.empty(),
      token: _asString(json['token']),
    );
  }

  /// ================= EMPTY =================
  factory AccountModel.empty() {
    return AccountModel(
      id: 0,
      firstName: '',
      lastName: '',
      email: '',
      phone: '',
      image: '',
      otp: 0,
      role: '',
      permissions: PermissionsModel.empty(),
      token: '',
    );
  }

  /// ================= TO JSON =================
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "image": image,
      "otp": otp,
      "role": role,
      "permission": permissions,
      "token": token,
    };
  }

  /// ================= HELPERS =================

  /// Full name for UI
  String get fullName => '$firstName $lastName'.trim();

  /// Is Admin
  bool get isAdmin => role.toLowerCase() == 'admin';

  /// ================= SAFE PARSERS =================
  static String _asString(dynamic value, [String defaultValue = '']) {
    if (value == null) return defaultValue;
    if (value is String && value.trim().isEmpty) return defaultValue;
    return value.toString();
  }

  static int _asInt(dynamic value, [int defaultValue = 0]) {
    if (value == null) return defaultValue;
    if (value is int) return value;
    return int.tryParse(value.toString()) ?? defaultValue;
  }
}
