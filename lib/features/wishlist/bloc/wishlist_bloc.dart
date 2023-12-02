import 'dart:async';

import 'package:ecommerce_bloc_ui/data/wishlist_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';


class WishlistBloc extends Bloc<WishlistEvent, WishlistState>{
  WishlistBloc() : super(WishlistInitialState()){
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveItemActionEvent>(wishlistRemoveItemActionEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistLoadedSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveItemActionEvent(WishlistRemoveItemActionEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productToBeRemoved);
    emit(WishlistLoadedSuccessState(wishlistItems: wishlistItems));
    emit(WishlistRemoveItemActionState());
  }
}