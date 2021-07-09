abstract class Product {
  int _codigo = 0;
  String _descricao = '';
  double _preco = 0.0;
  String _codigoBarras = '';

  get codigoBarras => _codigoBarras;

  get preco => _preco;

  get descricao => _descricao;

  get codigo => _codigo;
}
