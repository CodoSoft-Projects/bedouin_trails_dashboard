import 'about_us_model.dart';

class AboutUsItemsResponseModel {
  final bool status;
  final String message;
  final List<AboutUsModel> items;

  const AboutUsItemsResponseModel({
    required this.status,
    required this.message,
    required this.items,
  });

  factory AboutUsItemsResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const AboutUsItemsResponseModel(
        status: false,
        message: '',
        items: [],
      );
    }

    return AboutUsItemsResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      items: AboutUsModel.listFromJson(json['data']),
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
