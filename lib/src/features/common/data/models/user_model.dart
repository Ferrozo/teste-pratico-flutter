import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? token;

  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.lastName,
    required super.avatar,
     super.isFavorite,
     this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String token) {
    return UserModel(
      id: json['id'].toString(),
      name: json['first_name'] ?? '',
      email: json['email'],
      lastName: json['last_name'],
      avatar: json['avatar'],
      isFavorite: json['is_favorite'],
      token: token,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      avatar: map['avatar'],
      lastName: map['last_name'],
      isFavorite: map['is_favorite'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'is_favorite': isFavorite,
      'avatar': avatar,
    };
  }
}
