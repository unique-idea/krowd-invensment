import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:krowd_invesment_footer/models/project.dart';
import 'package:krowd_invesment_footer/modules/authentication/auth_controller.dart';
import 'package:krowd_invesment_footer/pages/login/widgets/user_services.dart';

class ProjectServices {
  static const String apiROOT =
      'https://funfund.onrender.com/api/projects/getAll';
  static Future<http.Response> getAllProjects() async {
    const url = '${UserService.apiROOT}/projects/getAll';
    final headers = UserService.getHeaders;
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);
    log(response.body);
    return response;
  }

  static Future<List<Project>> fetchProjects() async {
    const String url = apiROOT;
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.token}'
    };
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);
    debugPrint("Project ${response.body}");
    debugPrint("Status ${response.statusCode}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => Project.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch projects');
    }
  }

  static Future<List<Project>> fetchProjectsV2() async {
    const String url = '${UserService.apiROOT}projects/getAll';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.token}'
    };
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);
    debugPrint("Project $url");
    debugPrint("Project ${response.body}");
    debugPrint("Status ${response.statusCode}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.getRange(0,5).map((data) => Project.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch projects');
    }
  }

  static Future<bool> submitInvestment(Map investModel) async {
    const url =
        'http://funfundv2.ap-southeast-1.elasticbeanstalk.com/api/investments/invest';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.token}'
    };
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(investModel),
    );
    log("Investment:${response.body}");
    log('${AuthController.token}');
    log(url);
    log(investModel.toString());
    return response.statusCode == 200;
  }

  static Future<Project> synchronizeDataOnServer(int id) async {
    final url =
        'http://funfundv2.ap-southeast-1.elasticbeanstalk.com/api/projects/project/$id';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthController.token}'
    };
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: headers,
    );
    log('$url ${response.body}');
    if (response.statusCode == 200) {
      return Project.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data from the server');
    }
  }
}
