import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocerypractice/data/cart_items.dart';
import 'package:grocerypractice/features/home/models/home_product_dataModel.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemovedFromCartEvent>(cartRemovedFromCartEvent);
    on<CartProductWishListButtonClickedEvent>(cartProductWishListButtonClickedEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
      emit(CartSuccessState(cartItems: cartListItems));
 
  }

  FutureOr<void> cartRemovedFromCartEvent(CartRemovedFromCartEvent event, Emitter<CartState> emit) {
  cartListItems.remove(event.cartItems);
  emit(CartPageRemovedFromCartState());
  emit(CartSuccessState(cartItems: cartListItems));
  }

  FutureOr<void> cartProductWishListButtonClickedEvent(CartProductWishListButtonClickedEvent event, Emitter<CartState> emit) {
    cartListItems.add(event.cartItems);
    emit(CartPageWishListButtonClickedState());
  }
}
