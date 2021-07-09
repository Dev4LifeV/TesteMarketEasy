import 'package:flutter/material.dart';
import 'package:marketeasyapp/interfaces/entity/product.dart';

class ProductImpl implements Product {
  int? _codigo = 0;
  String? _descricao = '';
  double? _preco = 0.0;
  String? _codigoBarras = '';

  ProductImpl(
      {@required int? codigo,
      String? descricao,
      double? preco,
      String? codigoBarras})
      : this._codigo = codigo,
        this._descricao = descricao,
        this._preco = preco,
        this._codigoBarras = codigoBarras;

  @override
  String toString() {
    return 'R\$${this._preco!.toStringAsFixed(2)}';
  }

  String? get codigoBarras => _codigoBarras;

  double? get preco => _preco;

  String? get descricao => _descricao;

  int? get codigo => _codigo;
}
