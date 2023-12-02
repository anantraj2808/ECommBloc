import 'package:ecommerce_bloc_ui/models/Product.dart';

abstract class HomeEvent{}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final Product clickedProduct;
  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final Product clickedProduct;
  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent{}

class HomeCartButtonNavigateEvent extends HomeEvent{}