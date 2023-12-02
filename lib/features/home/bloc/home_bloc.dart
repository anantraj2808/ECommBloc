import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc_ui/data/cart_items.dart';
import 'package:ecommerce_bloc_ui/data/grocery_data.dart';
import 'package:ecommerce_bloc_ui/data/wishlist_items.dart';
import 'package:ecommerce_bloc_ui/models/Product.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(): super(HomeInitialState()){
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {

    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    try{
      emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e){
        return Product(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imageURL: e['imageUrl']);
      }).toList()));
    } catch(e){
      emit(HomeErrorState());
    }

  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    log("Wishlist navigate clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    log("Cart navigate clicked");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    log("Wishlist product clicked");
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    log("Cart product clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }
}