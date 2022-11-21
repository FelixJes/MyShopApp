import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/$urlSegment?key=AIzaSyCXl77hra74JEYnCNclU_t0TpPtJeUEr2M');

    final response = await http.post(url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
    print(json.decode(response.body));
  }

  Future<void> signUp(String email, String password) async {
   return _authenticate(email, password, 'accounts:signUp');
  }

  Future<void> logIn(String email, String password) async {
   return _authenticate(email, password, 'accounts:signInWithPassword');
  }
}
