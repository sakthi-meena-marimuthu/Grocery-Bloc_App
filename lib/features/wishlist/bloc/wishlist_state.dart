part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});
}

class WishListActionState extends WishlistState {}

class WishListPageCartButtonClickedState extends WishListActionState {}

class WishRemovedFromWishlistState extends WishListActionState {}
