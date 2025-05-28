import 'dart:convert';

import 'package:contactos/src/features/common/data/models/token_model.dart';
import 'package:contactos/src/features/common/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final http.Client client;
  // ignore: non_constant_identifier_names
  final API_KEY = 'reqres-free-v1';

  AuthRemoteDataSource(this.client);

  Future<TokenModel> login(String email, String password) async {
    final response = await client.post(
      headers: {'x-api-key': API_KEY, 'Accept': 'application/json'},
      Uri.parse('https://reqres.in/api/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return TokenModel.fromJson(json);
    } else {
      throw Exception('Erro ao fazer login');
    }
  }

  Future<UserModel> getUser(String token, int userId) async {
    final response = await client.get(
      Uri.parse('https://reqres.in/api/users/$userId'),
      headers: {
        'x-api-key': API_KEY,
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return UserModel.fromJson(json['data'], token);
    } else {
      throw Exception('Erro ao buscar dados do usuário');
    }
  }
}
