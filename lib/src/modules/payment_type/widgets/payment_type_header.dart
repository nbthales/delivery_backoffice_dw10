import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';
import '../payment_type_controller.dart';

class PaymentTypeHeader extends StatelessWidget {
  final PaymentTypeController controller;

  const PaymentTypeHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      title: 'ADMINISTRAR FORMAS DE PAGAMENTO',
      buttonLabel: 'ADICIONAR',
      buttonPressed: () {
        controller.addPayment();
      },
      filterWidget: DropdownButton<bool>(
        value: null,
        items: const [
          DropdownMenuItem(value: null, child: Text('Todos')),
          DropdownMenuItem(value: true, child: Text('Ativos')),
          DropdownMenuItem(value: false, child: Text('Inativos')),
        ],
        onChanged: (value) {},
      ),
    );
  }
}
