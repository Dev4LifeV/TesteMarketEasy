import 'package:marketeasyapp/interfaces/entity/user.dart';

import '../../enums/loggedStateEnum.dart';

abstract class Auth {
  Future<LoggedState> authenticate(User user);

  Future<Map<String, dynamic>> loadData();

  Future<LoggedState> clearData();

  Map<String, String>? toHeader();

  Future<LoggedState> isAuthenticated();
}
