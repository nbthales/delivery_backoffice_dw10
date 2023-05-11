import 'package:mobx/mobx.dart';

import '../../../repositories/products/product_repository.dart';
part 'products_controller.g.dart';

class ProductsController = ProductsControllerBase with _$ProductsController;

abstract class ProductsControllerBase with Store {
  final ProductRepository _productRepository;

  ProductsControllerBase(this._productRepository);
}
