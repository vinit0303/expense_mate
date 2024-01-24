class BaseResponseData {
  bool? success;
  String? message;
  Map<String,dynamic>? error;

  BaseResponseData({
    required this.success,
    required this.message,
    required this.error
  });

  BaseResponseData.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? false;
    message = json['message'] ?? "";
    error = json['error'];
    // errors = json['errors'];
  }
}