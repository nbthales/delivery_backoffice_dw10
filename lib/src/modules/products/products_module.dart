import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/products/product_repository_impl.dart';
import 'home/products_page.dart';

class ProductsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => ProductRepositoryImpl(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProductsPage()),
        //ChildRoute('/detail', child: (context, args) => const ProductsPage()),
      ];
}
