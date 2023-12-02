import 'package:ecommerce_bloc_ui/models/Product.dart';

abstract class WishlistEvent{}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveItemActionEvent extends WishlistEvent {
  Product productToBeRemoved;
  WishlistRemoveItemActionEvent({required this.productToBeRemoved});
}