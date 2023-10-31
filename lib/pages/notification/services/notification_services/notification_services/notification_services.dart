import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:krowd_invesment_footer/modules/authentication/auth_controller.dart';

import '../../../model/transaction_response.dart';

class NotificationServices {
  static Map<String, String>? generalHeaders;
  static Rx<Response> userInfo = Rx<Response>(const Response());

  //static const String baseUrl = 'http://funfund.onrender.com/api';
  static const String baseUrl =
      'http://funfundv2.ap-southeast-1.elasticbeanstalk.com/api';

  static Future<TransactionResponse?> fetchTransaction() async {
    const url = '$baseUrl/user/transaction-history?type=PERSONAL_TO_PROJECT';
    final uri = Uri.parse(url);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.token}'
    };

    try {
      final response = await http.put(uri, headers: headers);

      if (response.statusCode == 200) {
        final transactionResponseJson = jsonDecode(response.body);
        final transactionResponse =
            TransactionResponse.fromJson(transactionResponseJson);
        return transactionResponse;
      } else {
        log('Failed to fetch history with status code: ${response.statusCode} ${response.body}');

        return null;
      }
    } catch (e) {
      log('Error fetching user: $e');
      return null;
    }
  }
}
