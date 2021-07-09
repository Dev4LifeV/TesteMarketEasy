import 'package:marketeasyapp/entity/authResponseImpl.dart';
import '../functions.dart';
import 'package:marketeasyapp/enums/loggedStateEnum.dart';
import 'package:marketeasyapp/interfaces/entity/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../interfaces/auth/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthImpl implements Auth {
  AuthResponseImpl? _authResponse;

  AuthImpl._privateConstructor();
  static AuthImpl instance = AuthImpl._privateConstructor();
  Uri uri = Uri.http($URL, '/v1.1/auth');

  @override
  Future<LoggedState> authenticate(User user) async {
    try {
      http.Response? _response = await http.post(uri,
          body: json.encode(user.toMap()),
          headers: {"Content-Type": "application/json"});

      Map<String, dynamic> r = json.decode(_response.body);
      print(json.encode(user.toMap()));
      print(r);

      print(r["response"]["messages"][0]["message"]);

      if (r["response"]["messages"][0]["message"] == "Credenciais inválidas") {
        return LoggedState.WRONGDATA;
      } else if (r["response"]["messages"][0]["message"]
          .startsWith("Força Bruta detectada")) {
        return LoggedState.BRUTEFORCE;
      } else {
        this._authResponse = AuthResponseImpl(
            username: user.username,
            password: user.password,
            status: r["response"]["status"],
            token: r["response"]["token"],
            tokenExpiration: r["response"]["tokenExpiration"]);

        this._saveData(this._authResponse);

        return LoggedState.LOGGED;
      }
    } catch (error) {
      print(error);
      return LoggedState.FAILURE;
    }
  }

  void _saveData(AuthResponseImpl? auth) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tokenExpiration', auth!.tokenExpiration.toString());
    prefs.setString('token', auth.token.toString());
  }

  Future<LoggedState> isAuthenticated() async {
    Map<String, dynamic> data = await this.loadData();

    if (data["tokenExpiration"] != null && data["token"] != null) {
      if (formattedDateNow().isAfter(formatDate(data["tokenExpiration"]))) {
        this.clearData();
        return LoggedState.WRONGDATA;
      } else {
        return LoggedState.LOGGED;
      }
    } else {
      return LoggedState.WRONGDATA;
    }
  }

  @override
  Future<Map<String, dynamic>> loadData() async {
    Map<String, dynamic> data = Map();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenExpiration = prefs.getString('tokenExpiration');
    String? token = prefs.getString('token');

    data["token"] = token;
    data["tokenExpiration"] = tokenExpiration;

    return data;
  }

  Future<LoggedState> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return LoggedState.LOGOUT;
  }

  @override
  Map<String, String>? toHeader() {
    Map<String, String> map = Map();
    map['token'] = this._authResponse!.token.toString();
    return map;
  }
}
