abstract class User {
  String _username = '';
  String _password = '';

  get username => this._username;
  get password => this._password;

  Map<String?, String?> toMap();
}
