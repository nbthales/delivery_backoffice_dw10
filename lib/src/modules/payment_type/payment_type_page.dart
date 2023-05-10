import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import 'payment_type_controller.dart';
import 'widgets/payment_type_header.dart';
import 'widgets/payment_type_item.dart';

class PaymentTypePage extends StatefulWidget {
  const PaymentTypePage({super.key});

  @override
  State<PaymentTypePage> createState() => _PaymentTypePageState();
}

class _PaymentTypePageState extends State<PaymentTypePage>
    with Loader, Messages {
  final controller = Modular.get<PaymentTypeController>();
  final disposers = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case PaymentTypeStateStatus.initial:
            break;
          case PaymentTypeStateStatus.loading:
            showLoader();
            break;
          case PaymentTypeStateStatus.loaded:
            hideLoader();
            break;
          case PaymentTypeStateStatus.error:
            hideLoader();
            showError(
              controller.errorMessage ?? 'Erro ao buscar formas de pagamentos',
            );
            break;
          case PaymentTypeStateStatus.addOrUpdatePayment:
            hideLoader();
            showAddOrUpdatePayment();
            break;
        }
      });
      disposers.addAll([statusDisposer]);
      controller.loadPayments();
    });
  }

  void showAddOrUpdatePayment() {
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.black26,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
            elevation: 10,
            child: const Text('MODALX'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
      child: Column(
        children: [
          PaymentTypeHeader(
            controller: controller,
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Observer(
              builder: (context) {
                return GridView.builder(
                  itemCount: controller.paymentTypes.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 120,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    maxCrossAxisExtent: 680,
                  ),
                  itemBuilder: (context, index) {
                    final paymentTypeModel = controller.paymentTypes[index];
                    return PaymentTypeItem(
                      payment: paymentTypeModel,
                      controller: controller,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
