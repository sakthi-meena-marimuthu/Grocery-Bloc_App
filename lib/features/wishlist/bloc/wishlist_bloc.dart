import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocerypractice/data/cart_items.dart';
import 'package:grocerypractice/data/wishlist_items.dart';
import 'package:grocerypractice/features/home/models/home_product_dataModel.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishListInitialEvent);
    on<WishRemovedFromWishlistEvent>(wishRemovedFromWishlistEvent);
    on<WishlistProductCartButtonClickedEvent>(wishlistProductCartButtonClickedEvent);
  }

  FutureOr<void> wishListInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
      emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishRemovedFromWishlistEvent(WishRemovedFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.wishlistItems);
    emit(WishRemovedFromWishlistState());
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistProductCartButtonClickedEvent(WishlistProductCartButtonClickedEvent event, Emitter<WishlistState> emit) {
    cartListItems.add(event.wishlistItems);
  }
}
