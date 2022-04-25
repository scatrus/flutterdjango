import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterdjango/views/login_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/api_model.dart';

const _base = "http://10.0.2.2:8000";
const _tokenEndpoint = "/api-token-auth/";
const _tokenURL = _base + _tokenEndpoint;

Future<Token> getToken(
  UserLogin userLogin,
) async {
  debugPrint(_tokenURL);

  final http.Response response = await http.post(
    Uri.parse(_tokenURL),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  } else {
    Get.snackbar('Erro', json.decode(response.body).toString());
    Get.to(const LoginPage());
    throw Exception(json.decode(response.body));
  }
}
