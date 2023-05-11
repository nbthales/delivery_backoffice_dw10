import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/widgets/base_header.dart';
import 'products_controller.dart';
import 'widgets/product_item.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final controller = Modular.get<ProductsController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reaction((_) => controller.status, (status) {
        switch (status) {
          case ProductStateStatus.initial:
            // TODO: Handle this case.
            break;
          case ProductStateStatus.loading:
            // TODO: Handle this case.
            break;
          case ProductStateStatus.loaded:
            // TODO: Handle this case.
            break;
          case ProductStateStatus.error:
            // TODO: Handle this case.
            break;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50]!,
      padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
      child: Column(
        children: [
          BaseHeader(
            title: 'ADMINISTRAR PRODUTOS',
            buttonLabel: 'ADICIONAR PRODUTO',
            buttonPressed: () {},
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 280,
                mainAxisSpacing: 20,
                maxCrossAxisExtent: 280,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return const ProductItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
