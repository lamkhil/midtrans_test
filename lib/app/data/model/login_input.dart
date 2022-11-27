class LoginInput {
  String email;
  String password;

  LoginInput({required this.email, required this.password});

  toJson() => {'email': email, 'password': password};
}
