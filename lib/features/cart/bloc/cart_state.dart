part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;
  CartSuccessState({
    required this.cartItems,
  });
}

class CartActionState extends CartState {}

class CartPageWishListButtonClickedState extends CartActionState {}

class CartPageRemovedFromCartState extends CartActionState {}

