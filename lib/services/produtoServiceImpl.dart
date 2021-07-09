import 'package:http/http.dart' as http;
import 'package:marketeasyapp/entity/productImpl.dart';
import 'package:marketeasyapp/interfaces/auth/auth.dart';
import '../interfaces/services/produtoService.dart';
import '../constants.dart';
import 'dart:convert';

class ProductServiceImpl implements ProductService {
  ProductServiceImpl._privateConstructor();

  static final ProductServiceImpl instance =
      ProductServiceImpl._privateConstructor();

  http.Response? _response;

  Uri _uri = Uri.http(
      $URL, '/v2.0/produtounidade/listaprodutos/0/unidade/83402711000110');
  List<ProductImpl> _products = [];

  @override
  Future<List<ProductImpl>> getAll(Auth auth) async {
    try {
      this._response = await http.get(this._uri, headers: auth.toHeader());

      List<dynamic> r =
          json.decode(this._response!.body)["response"]["produtos"];

      print(r[0]);

      for (int i = 0; i < r.length; i++) {
        ProductImpl p = ProductImpl(
            descricao: r[i]["Descricao"],
            codigo: r[i]["Codigo"],
            codigoBarras: r[i]["CodigoBarras"],
            preco: r[i]["Preco"]);
        _products.add(p);
      }
    } catch (error) {
      print(error);
    }
    return _products;
  }
}
