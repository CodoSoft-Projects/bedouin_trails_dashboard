class UserModel {
  final int id;
  final String fullName;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String image;
  final bool isVerified;
  final int otp;
  final String token;

  const UserModel({
    required this.id,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.image,
    required this.isVerified,
    required this.otp,
    required this.token,
  });

  /// ================= FROM JSON =================
  factory UserModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return UserModel.empty();

    return UserModel(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      isVerified: json['is_verified'] ?? false,
      otp: json['otp'] ?? 0,
      token: json['token'] ?? '',
    );
  }

  /// ================= TO JSON =================
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'image': image,
      'is_verified': isVerified,
      'otp': otp,
      'token': token,
    };
  }

  /// ================= EMPTY =================
  factory UserModel.empty() {
    return const UserModel(
      id: 0,
      fullName: '',
      firstName: '',
      lastName: '',
      email: '',
      phone: '',
      image: '',
      isVerified: false,
      otp: 0,
      token: '',
    );
  }

  /// ================= COPY WITH =================
  UserModel copyWith({
    int? id,
    String? fullName,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? image,
    bool? isVerified,
    int? otp,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      isVerified: isVerified ?? this.isVerified,
      otp: otp ?? this.otp,
      token: token ?? this.token,
    );
  }

  /// ================= EQUALITY =================
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
