import 'pagination_model.dart';
import 'user_model.dart';

class UsersResponseModel {
  final bool status;
  final String message;
  final List<UserModel> users;
  final PaginationModel pagination;

  const UsersResponseModel({
    required this.status,
    required this.message,
    required this.users,
    required this.pagination,
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
      pagination: PaginationModel.fromJson(json['pagination']),
    );
  }

  /// ================= EMPTY =================
  factory UsersResponseModel.empty() {
    return UsersResponseModel(
      status: false,
      message: '',
      users: [],
      pagination: PaginationModel.empty(),
    );
  }

  /// ================= HELPERS =================
  bool get isEmpty => users.isEmpty;
  bool get isNotEmpty => users.isNotEmpty;
}
