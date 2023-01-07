import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  Future<void> login(String email, String password) async {
    final url = Uri.parse('https://build1.saviway.com/auth/login');

    try {
      final response = await http.get(url, headers: {
        'email': email,
        'password': password,
      });
    } catch (error) {}
  }
}
