import 'dart:convert';
import 'dart:io';

import 'package:contactos/src/features/common/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class ContactsRemoteDataSource {
  Future<List<UserModel>> fetchContacts();
}

class ContactsRemoteDataSourceImpl implements ContactsRemoteDataSource {
  final http.Client client;
  // ignore: non_constant_identifier_names
  final API_KEY = 'reqres-free-v1';

  ContactsRemoteDataSourceImpl(this.client);

  @override
  Future<List<UserModel>> fetchContacts() async {
    try {
      final response = await client.get(
        Uri.parse('https://reqres.in/api/users?page=2'),
        headers: {'x-api-key': API_KEY, 'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List data = json['data'];
        return data.map((e) => UserModel.fromJson(e, "")).toList();
      } else {
        throw Exception('Erro ao buscar contatos: código ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Sem conexão com a internet.');
    } on http.ClientException catch (e) {
      throw Exception('Erro de conexão: ${e.message}');
    } catch (e) {
      throw Exception('Erro inesperado: ${e.toString()}');
    }
  }
}
