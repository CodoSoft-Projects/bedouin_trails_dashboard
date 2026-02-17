import 'about_us_model.dart';

class AboutUsResponseModel {
  final bool status;
  final String message;
  final AboutUsModel item;

  const AboutUsResponseModel({
    required this.status,
    required this.message,
    required this.item,
  });

  factory AboutUsResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const AboutUsResponseModel(
        status: false,
        message: '',
        item: AboutUsModel.empty,
      );
    }

    return AboutUsResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      item: AboutUsModel.fromJson(json['data']),
    );
  }
}
