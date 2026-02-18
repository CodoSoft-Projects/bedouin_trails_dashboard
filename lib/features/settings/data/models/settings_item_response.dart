import 'settings_item_model.dart';

class SettingsItemResponse {
  final bool status;
  final String message;
  final SettingsItemModel item;

  const SettingsItemResponse({
    required this.status,
    required this.message,
    required this.item,
  });

  factory SettingsItemResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const SettingsItemResponse(
        status: false,
        message: '',
        item: SettingsItemModel.empty,
      );
    }

    return SettingsItemResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      item: SettingsItemModel.fromJson(json['data']),
    );
  }
}
