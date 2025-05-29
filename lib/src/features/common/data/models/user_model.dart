import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? token;

  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.avatar,
     this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String token) {
    return UserModel(
      id: json['id'].toString(),
      name: json['first_name'] ?? '',
      email: json['email'],
      avatar: json['avatar'],
      token: token,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      avatar: map['avatar'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
    };
  }
}
