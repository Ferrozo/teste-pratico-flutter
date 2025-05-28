import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String token;

  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String token) {
    return UserModel(
      id: json['id'].toString(),
      name: json['first_name'] ?? '',
      email: json['email'],
      token: token,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }
}
