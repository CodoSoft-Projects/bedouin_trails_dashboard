import 'user_model.dart';

class UsersResponseModel {
  final bool status;
  final String message;
  final List<UserModel> users;

  const UsersResponseModel({
    required this.status,
    required this.message,
    required this.users,
  });

  /// ================= FROM JSON =================
  factory UsersResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return UsersResponseModel.empty();

    final rawList = json['data'];

    List<UserModel> parsedUsers = [];

    if (rawList is List) {
      parsedUsers = rawList
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>?))
          .toList();
    }

    return UsersResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      users: parsedUsers,
    );
  }

  /// ================= EMPTY =================
  factory UsersResponseModel.empty() {
    return const UsersResponseModel(
      status: false,
      message: '',
      users: [],
    );
  }

  /// ================= HELPERS =================
  bool get isEmpty => users.isEmpty;
  bool get isNotEmpty => users.isNotEmpty;
}
