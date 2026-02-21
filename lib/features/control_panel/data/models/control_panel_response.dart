import 'control_panel_model.dart';

class ControlPanelResponse {
  final bool status;
  final String message;
  final ControlPanelModel data;

  ControlPanelResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ControlPanelResponse.fromJson(Map<String, dynamic> json) {
    return ControlPanelResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: ControlPanelModel.fromJson(json['data']),
    );
  }
}
