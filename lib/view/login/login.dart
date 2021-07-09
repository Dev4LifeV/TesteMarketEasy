import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketeasyapp/entity/userImpl.dart';
import 'package:marketeasyapp/state_management/loginController.dart';
import 'package:marketeasyapp/styles/formFieldStyle.dart';
import 'package:marketeasyapp/view/widgets/roundedButton.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Scaffold(
            body: Stack(
          children: [
            Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/hamburguer.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffdd3762).withAlpha(150),
                  Color(0xffe8547a).withAlpha(150),
                  Colors.white.withAlpha(150)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    heightFactor: 2.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Image.asset(
                          'assets/logo-market-easy-branco.png',
                          scale: 2,
                        ))
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: _width * 0.3,
                          child: TextField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            controller: _username,
                            decoration: FormFieldStyle(hintText: "Usuário"),
                          ),
                        ),
                        Container(
                          width: _width * 0.3,
                          margin: EdgeInsets.symmetric(vertical: 30),
                          child: TextField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            controller: _password,
                            decoration: FormFieldStyle(hintText: "Senha"),
                          ),
                        ),
                        Obx(() => !_loginController.buttonPressedLogin.value
                            ? Container(
                                width: _width * 0.3,
                                child: RoundedButton(
                                    onPressed: () => _loginController.login(
                                        UserImpl(
                                            username: _username.text,
                                            password: _password.text)),
                                    child: Text('Entrar',
                                        style: TextStyle(
                                            color: Color(0xffff4081)))))
                            : Container(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xffff4081)),
                                ),
                              ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
      } else {
        return Scaffold(
            body: Stack(
          children: [
            Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/hamburguer.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffdd3762).withAlpha(150),
                  Color(0xffe8547a).withAlpha(150),
                  Colors.white.withAlpha(150)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    heightFactor: 2,
                    child: Container(
                        child: Image.asset(
                      'assets/logo-market-easy-branco.png',
                      scale: 2.5,
                    )),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Center(
                          heightFactor: 0.75,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                width: _width * 0.3,
                                child: TextField(
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  controller: _username,
                                  decoration:
                                      FormFieldStyle(hintText: "Usuário"),
                                ),
                              ),
                              Container(
                                width: _width * 0.3,
                                margin: EdgeInsets.symmetric(vertical: 30),
                                child: TextField(
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  controller: _password,
                                  decoration: FormFieldStyle(hintText: "Senha"),
                                ),
                              )
                            ],
                          ),
                        ),
                        Obx(() => !_loginController.buttonPressedLogin.value
                            ? Container(
                                margin: EdgeInsets.only(top: 10),
                                width: _width * 0.3,
                                child: RoundedButton(
                                    onPressed: () => _loginController.login(
                                        UserImpl(
                                            username: _username.text,
                                            password: _password.text)),
                                    child: Text('Entrar',
                                        style: TextStyle(
                                            color: Color(0xffff4081)))))
                            : Container(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xffff4081)),
                                ),
                              ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
      }
    });
  }
}
