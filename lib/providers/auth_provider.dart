import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone_flutter_app/utils/consts.dart';
import 'package:facebook_clone_flutter_app/utils/tools.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;

  String get userId => _userId;
  String _userEmail;
  String _userName;

  DateTime _expiryDate;
  Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get userEmail => _userEmail;

  String get userName => _userName;

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(String email, String password, String urlSegment,
      {String name}) async {
    final url = '$BASE_URL$urlSegment?key=$WEB_API_KEY';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            "displayName": name,
            'returnSecureToken': true,
          },
        ),
      );

      Tools.logger.d("Authenticated successful ($urlSegment)");
      Tools.logger.i(json.decode(response.body));

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _userEmail = responseData['email'];
      _userName = responseData['displayName'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(responseData['localId'])
          .set({
        'userId': _userId,
        'email': _userEmail,
        'username': _userName,
        'password': password,
        'createdAt': Timestamp.now(),
      });

      // _autoLogout();

      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'email': _userEmail,
          'username': _userName,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
      prefs.setString('permanent_token', _token);
    } on Exception catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'verifyPassword');
  }

  Future<void> signup(String email, String password, String username) async {
    return _authenticate(email, password, 'signupNewUser', name: username);
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _userEmail = extractedUserData['email'];
    _userName = extractedUserData['username'];
    _expiryDate = expiryDate;
    notifyListeners();
    // _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _userName = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
