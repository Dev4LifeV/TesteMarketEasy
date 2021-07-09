import 'package:get/get.dart';
import 'package:marketeasyapp/state_management/loginController.dart';
import 'package:marketeasyapp/state_management/productController.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    final ProductController _productController = Get.find<ProductController>();
    final LoginController _loginController = Get.find<LoginController>();

    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return WillPopScope(
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  leading: IconButton(
                      icon: Icon(Icons.logout, color: Colors.white),
                      onPressed: () => _loginController.logout()),
                  title: Container(
                    child: Image.asset(
                      'assets/logo-market-easy-branco.png',
                      scale: 5,
                    ),
                  ),
                  backgroundColor: Color(0xffff4081),
                ),
                floatingActionButton: FloatingActionButton(
                    backgroundColor: Color(0xffff4081),
                    child: Obx(() => _productController
                            .buttonPressedGetProducts.value
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Icon(Icons.get_app_outlined, color: Colors.white)),
                    onPressed: () async => await _productController.getItems()),
                body: Obx(
                  () => _productController.items.isEmpty
                      ? Center(
                          child: Text(
                              "Pressione o botão abaixo para obter a listagem dos produtos"))
                      : ListView.builder(
                          itemCount: _productController.items.length,
                          itemBuilder: (context, index) =>
                              _productController.items[index],
                          scrollDirection: Axis.vertical,
                        ),
                )),
            onWillPop: () async => false);
      } else {
        return WillPopScope(
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  leading: IconButton(
                      icon: Icon(Icons.logout, color: Colors.white),
                      onPressed: () => _loginController.logout()),
                  title: Container(
                    child: Image.asset(
                      'assets/logo-market-easy-branco.png',
                      scale: 5,
                    ),
                  ),
                  backgroundColor: Color(0xffff4081),
                ),
                floatingActionButton: FloatingActionButton(
                    backgroundColor: Color(0xffff4081),
                    child: Obx(() => _productController
                            .buttonPressedGetProducts.value
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Icon(Icons.get_app_outlined, color: Colors.white)),
                    onPressed: () async => await _productController.getItems()),
                body: Obx(() => _productController.items.isEmpty
                    ? Center(
                        child: Text(
                            "Pressione o botão abaixo para obter a listagem dos produtos"))
                    : ListView.builder(
                        itemCount: _productController.items.length,
                        itemBuilder: (context, index) =>
                            _productController.items[index]))),
            onWillPop: () async => false);
      }
    });
  }
}
