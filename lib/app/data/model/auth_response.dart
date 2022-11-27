import 'package:midtrans_test/app/data/model/user_model.dart';

class AuthResponse {
  String message;
  User? user;
  bool success;

  AuthResponse(
      {required this.message, required this.success, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
        message: json['message'],
        user: json['data'] != null ? User.fromJson(json['data']) : null,
        success: json['success']);
  }
}
