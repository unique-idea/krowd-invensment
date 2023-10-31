import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:krowd_invesment_footer/modules/authentication/auth_controller.dart';

import '../../../modules/user/models/user.dart';

class PersonServices {
  static Map<String, String>? generalHeaders;
  static Rx<Response> userInfo = Rx<Response>(const Response());

  static const String baseUrl = 'https://funfund.onrender.com/api';

  static Future<Map<String, dynamic>?> fetchUser() async {
    const url = '$baseUrl/user';
    final uri = Uri.parse(url);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.token}'
    };

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final user = jsonDecode(response.body) as Map<String, dynamic>;
        return user;
      } else {
        log('Failed to fetch user with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error fetching user: $e');
      return null;
    }
  }

  static Future<User?> updateUser(Map<String, dynamic> body) async {
    const url = '$baseUrl/user/update';
    final uri = Uri.parse(url);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.token}'
    };
    try {
      final response = await http.put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final updatedUser = User.fromJson(jsonDecode(response.body));
        return updatedUser;
      } else {
        log('Update failed with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error updating user: $e');
      return null;
    }
  }
}
