import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:krowd_invesment_footer/pages/wallet/model/wallet_transfer.dart';
import '../../../modules/authentication/auth_controller.dart';

class WalletService {
  static Map<String, String>? generalHeaders;
  static const String baseUrl = 'https://funfund.onrender.com/api';

  static Future<Map<String, dynamic>?> fetchGeneralWallet() async {
    const url = '$baseUrl/user/general-wallet';
    final uri = Uri.parse(url);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.token}'
    };

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final generalWallet = jsonDecode(response.body) as Map<String, dynamic>;
        return generalWallet;
      } else {
        log('Failed to fetch general wallet with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error fetching general wallet: $e');
      return null;
    }
  }

  static Future<Map<String, dynamic>?> fetchCollectionWallet() async {
    const url = '$baseUrl/user/collection-wallet';
    final uri = Uri.parse(url);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.token}'
    };

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final collectionWallet =
            jsonDecode(response.body) as Map<String, dynamic>;
        return collectionWallet;
      } else {
        log('Failed to fetch collection wallet with status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error fetching collection wallet: $e');
      return null;
    }
  }

  static Future<Void?> tranferMoney(
      String fromWallet, String toWallet, double amount) async {
    const url = 'http://funfundv2.ap-southeast-1.elasticbeanstalk.com/api/user/transfer-money';
    final uri = Uri.parse(url);

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.token}'
    };
    if (fromWallet == "General Wallet") {
      fromWallet = "GENERAL_WALLET";
      if (toWallet == "General Wallet") {
        toWallet = "GENERAL_WALLET";
      }
    }

    if (fromWallet == "Collection Wallet") {
      fromWallet = "COLLECTION_WALLET";
      if (toWallet == "Collection Wallet") {
        toWallet = "COLLECTION_WALLET";
      }
    }
    Map<String, dynamic> walletTransfer = {
      "fromWallet": fromWallet,
      "toWallet": toWallet,
      "amount": amount,
      "description": "demo"
    };

    try {
      final response = await http.put(
        uri,
        headers: headers,
        body: jsonEncode(walletTransfer),
      );
      log(response.body);
      if (response.statusCode == 200) {
        log("tranfer success");
      } else {
        log('Failed to tranfer  wallet with status code: ${response.statusCode} ${response.body} ');
      }
    } catch (e) {
      log('Error transfer wallet: $e');
    }
    return null;
  }
}
