import 'bloc/wishlist_event.dart';
import 'bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/wishlist_state.dart';
import 'wishlist_tile_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Wishlist"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        builder: (context, state){
          switch(state.runtimeType){
            case WishlistLoadedSuccessState:
              final successState = state as WishlistLoadedSuccessState;
              return ListView.builder(
                itemBuilder: (context, index){
                  return WishlistTileWidget(
                    product: successState.wishlistItems[index],
                    wishlistBloc: wishlistBloc,
                  );
                },
                itemCount: successState.wishlistItems.length,
              );
            default:
              return Container();
          }
        },
        listener: (context, state){
          if(state is WishlistRemoveItemActionState){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item removed successfully"))
            );
          }
        },
        buildWhen: (prev, current){
          return current is !WishlistActionState;
        },
        listenWhen: (prev, current){
          return current is WishlistActionState;
        },
      ),
    );
  }
}
