class SimpleModel {
  final bool status;
  final String message;

  const SimpleModel({required this.status, required this.message});

  /// ================= FROM JSON =================
  factory SimpleModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return SimpleModel.empty();

    return SimpleModel(
      status: _asBool(json['status']),
      message: _asString(json['message']),
    );
  }

  /// ================= EMPTY =================
  factory SimpleModel.empty() {
    return SimpleModel(status: false, message: '');
  }

  /// ================= TO JSON =================
  Map<String, dynamic> toJson() {
    return {"status": status, "message": message};
  }

  /// ================= HELPERS =================

  bool get isSuccess => status;

  bool get isFailure => !status;

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
