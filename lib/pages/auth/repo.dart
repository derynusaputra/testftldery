import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Repo {
  static var url = Uri.parse('https://uat-api.ftlgym.com/api/v1/test/login');

  static Future<int> postLogin(String username, String password) async {
    final body = {"email": username, "password": password};

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

    return response.statusCode;

    // return response;
  }
}
