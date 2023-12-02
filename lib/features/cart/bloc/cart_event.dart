import 'package:ecommerce_bloc_ui/models/Product.dart';

abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}

class CartRemoveFromCartButtonClickedCartEvent extends CartEvent{
  final Product productToBeRemoved;
  CartRemoveFromCartButtonClickedCartEvent({required this.productToBeRemoved});
}