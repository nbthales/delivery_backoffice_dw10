// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../models/product_model.dart';

class OrderProductDto {
  final ProductModel product;
  final int amount;
  final double totalPrice;
  OrderProductDto({
    required this.product,
    required this.amount,
    required this.totalPrice,
  });
}
