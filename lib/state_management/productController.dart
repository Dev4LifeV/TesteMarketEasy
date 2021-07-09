import 'package:get/get.dart';
import 'package:marketeasyapp/interfaces/auth/auth.dart';
import 'package:marketeasyapp/interfaces/entity/product.dart';
import '../auth/auth_impl.dart';
import '../enums/loggedStateEnum.dart';
import '../services/produtoServiceImpl.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  var buttonPressedGetProducts = false.obs;
  var _items = [].obs;

  Auth _authImpl = AuthImpl.instance;
  ProductServiceImpl _productServiceImpl = ProductServiceImpl.instance;

  Future getItems() async {
    LoggedState _loggedState = await _authImpl.isAuthenticated();

    buttonPressedGetProducts.value = true;

    if (_loggedState == LoggedState.WRONGDATA) {
      Get.offAllNamed('/login');
      Get.snackbar('Divergência',
          'Sua sessão expirou. Por favor, autentique-se novamente.');
      buttonPressedGetProducts.value = false;
    } else if (_loggedState == LoggedState.FAILURE) {
      Get.offAllNamed('/login');
      Get.snackbar('Erro',
          'Sentimos muito. Ocorreu um erro ao autenticar-se ao sistema. Para sua segurança, expiramos sua sessão.');
      buttonPressedGetProducts.value = false;
    } else {
      try {
        items.clear();
        List<Product> products = await _productServiceImpl.getAll(_authImpl);
        for (Product p in products) {
          Widget list = ListTile(
            title: Text(p.descricao),
            subtitle:
                Text('R\$${p.preco.toStringAsFixed(2).replaceAll('.', ',')}'),
          );
          items.add(list);
        }
        buttonPressedGetProducts.value = false;
      } catch (error) {
        Get.snackbar('Erro',
            'Sentimos muito. Ocorreu um erro, por favor, contate o suporte técnico ou tente novamente mais tarde.');
      }
    }
  }

  get items => this._items;
}
