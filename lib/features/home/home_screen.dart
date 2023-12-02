import 'package:ecommerce_bloc_ui/features/cart/cart_screen.dart';
import 'package:ecommerce_bloc_ui/features/home/bloc/home_bloc.dart';
import 'package:ecommerce_bloc_ui/features/home/bloc/home_event.dart';
import 'package:ecommerce_bloc_ui/features/home/bloc/home_state.dart';
import 'package:ecommerce_bloc_ui/features/home/productTileWidget.dart';
import 'package:ecommerce_bloc_ui/features/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (prev, current){
        return current is HomeActionState;
      },
      buildWhen: (prev, current){
        return current is !HomeActionState;
      },
      listener: (context, state){
        if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
        } else if(state is HomeNavigateToWishlistPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen()));
        } else if(state is HomeProductItemCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Item added to Cart"))
          );
        } else if(state is HomeProductItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Item added to Wishlist"))
          );
        }
      },
      builder: (context, state){
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text("Grocery App",),
                actions: [
                  IconButton(
                    onPressed: (){
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: (){
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  )
                ],
              ),
              body: ListView.builder(
                itemBuilder: (context, index){
                  return ProductTileWidget(
                    product: successState.products[index],
                    homeBloc: homeBloc,
                  );
                },
                itemCount: successState.products.length,
              ),
            );
          case HomeErrorState:
            return const Scaffold(body: Center(child: Text('Error')));
          default:
            return const SizedBox();
        }
      },
    );
  }
}
