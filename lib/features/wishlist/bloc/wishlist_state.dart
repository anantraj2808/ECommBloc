import 'package:ecommerce_bloc_ui/models/Product.dart';

abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishListLoadingState extends WishlistState {}

class WishlistLoadedSuccessState extends WishlistState {
  final List<Product> wishlistItems;

  WishlistLoadedSuccessState({required this.wishlistItems});
}

class WishlistErrorState extends WishlistState {}

class WishlistRemoveItemActionState extends WishlistActionState{}