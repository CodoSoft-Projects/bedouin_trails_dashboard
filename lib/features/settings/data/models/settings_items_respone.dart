import 'settings_item_model.dart';

class SettingsItemsResponse {
  final bool status;
  final String message;
  final List<SettingsItemModel> items;

  const SettingsItemsResponse({
    required this.status,
    required this.message,
    required this.items,
  });

  factory SettingsItemsResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const SettingsItemsResponse(status: false, message: '', items: []);
    }

    return SettingsItemsResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      items: SettingsItemModel.listFromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': items.map((e) => e.toJson()).toList(),
    };
  }
}
