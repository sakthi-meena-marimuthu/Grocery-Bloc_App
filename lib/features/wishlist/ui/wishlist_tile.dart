import 'package:flutter/material.dart';
import 'package:grocerypractice/features/home/models/home_product_dataModel.dart';
import 'package:grocerypractice/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc}
      
      );

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
                    image: NetworkImage(productDataModel.imgurl))),
          ),
          const SizedBox(height: 15),
          Text(productDataModel.name,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text(productDataModel.description,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${productDataModel.price}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        wishlistBloc.add(WishRemovedFromWishlistEvent(wishlistItems: productDataModel));
                      },
                      icon: const Icon(Icons.favorite),color: Colors.red,),
                  IconButton(
                      onPressed: () {
                        wishlistBloc.add(WishlistProductCartButtonClickedEvent(wishlistItems: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_cart_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
