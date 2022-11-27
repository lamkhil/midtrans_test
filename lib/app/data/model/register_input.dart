class RegisterInput {
  String fullName;
  String email;
  String phone;
  String password;

  RegisterInput(
      {required this.email,
      required this.fullName,
      required this.password,
      required this.phone});

  toJson() =>
      {'name': fullName, 'email': email, 'phone': phone, 'password': password};
}
