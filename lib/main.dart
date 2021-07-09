import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketeasyapp/state_management/loginController.dart';
import 'package:marketeasyapp/state_management/productController.dart';
import 'package:marketeasyapp/view/home/home.dart';
import 'package:marketeasyapp/view/login/login.dart';
import 'auth/auth_impl.dart';
import 'enums/loggedStateEnum.dart';
import 'interfaces/auth/auth.dart';

void main() async {
  Get.put(LoginController());
  Get.put(ProductController());

  WidgetsFlutterBinding.ensureInitialized();

  Auth _authImpl = AuthImpl.instance;
  LoggedState _loggedState = await _authImpl.isAuthenticated();

  runApp(GetMaterialApp(
    title: "Market Easy App",
    color: Color(0xffff4081),
    initialRoute: _loggedState == LoggedState.LOGGED ? '/home' : '/login',
    locale: Locale('pt', 'BR'),
    getPages: [
      GetPage(name: '/login', page: () => Login()),
      GetPage(name: '/home', page: () => Home())
    ],
  ));
}
