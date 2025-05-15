class ResponseRegisterModel {
  final bool status;
  final String message;

  ResponseRegisterModel({required this.status, required this.message});

  factory ResponseRegisterModel.fromJson(Map<String, dynamic> jsonData) {
    return ResponseRegisterModel(
      status: jsonData["status"] ?? false,
      message: jsonData["message"] ?? '',
    );
  }
}
