import 'bloc/cart_bloc.dart';
import 'bloc/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_state.dart';
import 'cartTileWidget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Cart"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        builder: (context, state){
          switch(state.runtimeType){
            case CartLoadedSuccessState:
              final successState = state as CartLoadedSuccessState;
              return ListView.builder(
                itemBuilder: (context, index){
                  return CartTileWidget(
                    product: successState.cartItems[index],
                    cartBloc: cartBloc,
                  );
                },
                itemCount: successState.cartItems.length,
              );
            default:
              return Container();
          }
        },
        listener: (context, state){
          if(state is CartItemRemovedActionState){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Item removed"),
              )
            );
          }
        },
        listenWhen: (prev, current){
          return current is CartActionState;
        },
        buildWhen: (prev, current){
          return current is !CartActionState;
        },
      ),
    );
  }
}
