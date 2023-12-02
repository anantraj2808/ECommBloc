import 'package:ecommerce_bloc_ui/features/home/bloc/home_bloc.dart';
import 'package:ecommerce_bloc_ui/features/home/bloc/home_event.dart';
import 'package:ecommerce_bloc_ui/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class ProductTileWidget extends StatelessWidget {
  final Product product;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(product.imageURL))),
          ),
          const SizedBox(height: 20),
          Text(product.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(product.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + product.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          clickedProduct: product
                        ));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickedEvent(
                          clickedProduct: product
                        ));
                      },
                      icon: Icon(Icons.shopping_cart_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}