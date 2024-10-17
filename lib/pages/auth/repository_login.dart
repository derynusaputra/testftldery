import 'package:get/get.dart';

class ApiService extends GetConnect {
  // Base URL API
  final String baseUrl =
      'https://uat-api.ftlgym.com/api/v1/test/login'; // Ganti dengan URL API Anda

  // Fungsi untuk melakukan POST login
  Future<Response> postLogin(String username, String password) async {
    // Endpoint untuk login
    final String loginUrl = '$baseUrl';

    // Request body (data yang dikirim ke server)
    final body = {
      'email': username,
      'password': password,
    };

    // Lakukan request POST dan kembalikan hasilnya
    try {
      final response = await post(loginUrl, body);
      return response; // Kembalikan response
    } catch (e) {
      return Response(statusCode: 500, statusText: 'Error: $e');
    }
  }
}
