import 'package:flutter/material.dart';
import 'package:marketeasyapp/interfaces/entity/user.dart';

class UserImpl implements User {
  String? _username;
  String? _password;

  UserImpl({@required String? username, String? password})
      : this._username = username,
        this._password = password;

  @override
  Map<String?, String?> toMap() {
    Map<String?, String?> map = Map();

    map['usuario'] = this._username;
    map['senha'] = this._password;

    return map;
  }

  @override
  get password => this._password;

  @override
  get username => this._username;
}
