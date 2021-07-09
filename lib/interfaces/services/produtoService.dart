import 'package:marketeasyapp/auth/auth_impl.dart';
import 'package:marketeasyapp/entity/productImpl.dart';

abstract class ProductService {
  Future<List<ProductImpl>> getAll(AuthImpl auth);
}
