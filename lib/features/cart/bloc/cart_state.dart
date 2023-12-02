import 'package:ecommerce_bloc_ui/models/Product.dart';

abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitialState extends CartState{}

class CartLoadingState extends CartState{}

class CartLoadedSuccessState extends CartState{
  final List<Product> cartItems;
  CartLoadedSuccessState({required this.cartItems});
}

class CarrErrorState extends CartState{}

class CartItemRemovedActionState extends CartActionState{}