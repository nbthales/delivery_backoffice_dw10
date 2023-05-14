import '../../dto/order/order_dto.dart';
import '../../models/orders/order_model.dart';

abstract class GetOrderById {
  Future<OrderDto> call(OrderModel order);
}
