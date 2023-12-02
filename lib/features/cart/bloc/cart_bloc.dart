import 'dart:async';
import 'package:ecommerce_bloc_ui/data/cart_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  CartBloc(): super(CartInitialState()){
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartButtonClickedCartEvent>(cartRemoveFromCartButtonClickedCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartLoadedSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartButtonClickedCartEvent(CartRemoveFromCartButtonClickedCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productToBeRemoved);
    emit(CartLoadedSuccessState(cartItems: cartItems));
    emit(CartItemRemovedActionState());
  }
}