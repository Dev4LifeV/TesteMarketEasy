import 'package:get/get.dart';
import 'package:marketeasyapp/interfaces/auth/auth.dart';
import 'package:marketeasyapp/interfaces/entity/user.dart';
import '../auth/auth_impl.dart';
import '../enums/loggedStateEnum.dart';

class LoginController extends GetxController {
  var _buttonPressedLogin = false.obs;

  Auth _authImpl = AuthImpl.instance;

  void login(User user) async {
    this.buttonPressedLogin.value = true;

    LoggedState loggedState = await _authImpl
        .authenticate(user)
        .timeout(Duration(seconds: 5), onTimeout: () => LoggedState.FAILURE);
    if (loggedState == LoggedState.LOGGED) {
      this.buttonPressedLogin.value = false;
      Get.toNamed('/home');
    } else if (loggedState == LoggedState.FAILURE) {
      this.buttonPressedLogin.value = false;
      Get.snackbar('Erro',
          'Sentimos muito. Ocorreu um erro, por favor, contate o suporte técnico ou tente novamente mais tarde.');
    } else if (loggedState == LoggedState.BRUTEFORCE) {
      this.buttonPressedLogin.value = false;
      Get.snackbar('Erro',
          'Ataque de força bruta detectada. Múltiplas tentativas de login. Por favor, contate o suporte.');
    } else if (loggedState == LoggedState.WRONGDATA) {
      Get.snackbar('Divergência',
          'Credenciais inválidas. Por favor, verifique suas credenciais e tente novamente.');
    }
  }

  void logout() async {
    LoggedState loggedState = await _authImpl.clearData();
    if (loggedState == LoggedState.LOGOUT) Get.offAllNamed('/login');
  }

  get buttonPressedLogin => this._buttonPressedLogin;
}
