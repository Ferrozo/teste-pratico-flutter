class UserEntity {
  final String id;
  final String name;
  final String lastName;
  final String email;
  final String avatar;
  final bool? isFavorite;


  UserEntity({required this.id, required this.name, required this.lastName, required this.email, required this.avatar,  this.isFavorite});
}