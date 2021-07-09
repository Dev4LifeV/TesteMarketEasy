import 'package:flutter/material.dart';
import 'package:marketeasyapp/interfaces/entity/authResponse.dart';

class AuthResponseImpl implements AuthResponse {
  String? _username;
  String? _password;
  String? _status;
  String? _token;
  String? _tokenExpiration;

  AuthResponseImpl(
      {@required String? username, String? password, String? status, String? token, String? tokenExpiration})
      : this._username = username,
        this._password = password,
        this._status = status,
        this._token = token,
        this._tokenExpiration = tokenExpiration;

  String? get tokenExpiration => _tokenExpiration;

  String? get token => _token;

  String? get status => _status;

  String? get username => _username;

  String? get password => _password;
}
