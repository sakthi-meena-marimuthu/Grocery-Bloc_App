part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemovedFromCartEvent extends CartEvent{
    final ProductDataModel cartItems;
  CartRemovedFromCartEvent({
    required this.cartItems,
  });
}

class CartProductWishListButtonClickedEvent extends CartEvent{
  final ProductDataModel cartItems;

  CartProductWishListButtonClickedEvent({required this.cartItems});


}