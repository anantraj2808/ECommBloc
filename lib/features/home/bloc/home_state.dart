import 'package:ecommerce_bloc_ui/models/Product.dart';

abstract class HomeState {}
abstract class HomeActionState extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<Product> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState{}

class HomeProductItemCartedActionState extends HomeActionState{}
