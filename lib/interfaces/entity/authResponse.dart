abstract class AuthResponse {
  String _username = '';
  String _password = '';
  String _status = '';
  String _token = '';
  String _tokenExpiration = '';

  String? get tokenExpiration => _tokenExpiration;

  String? get token => _token;

  String? get status => _status;

  String? get username => _username;

  String? get password => _password;
}
