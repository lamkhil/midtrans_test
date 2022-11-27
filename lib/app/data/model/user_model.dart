class User {
  late int id;
  late String name;
  late String email;
  late String phone;
  String? foto;
  String? fcm;
  String? token;
  String? createdAt;
  String? updatedAt;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      this.foto,
      required this.fcm,
      this.token,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    foto = json['foto'];
    fcm = json['fcm'];
    token = json['token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['foto'] = foto;
    data['fcm'] = fcm;
    data['token'] = token;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
