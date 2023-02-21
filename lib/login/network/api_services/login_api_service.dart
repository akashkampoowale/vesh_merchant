import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vesh_merchant/common/url/url.dart';
import 'package:vesh_merchant/login/responses/login_response.dart';

class LoginApiService {

  login(username, password) async {
    final body = {'username': username, 'password': password};

    var response = await http.post(
        Uri.parse(
            '$serviceApiUrl/login.php'),
        body: body
    );

    print(response.body);

    return LoginResponse.fromJson(
        jsonDecode(response.body)
    );
  }
}