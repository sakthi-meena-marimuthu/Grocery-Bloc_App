part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishRemovedFromWishlistEvent extends WishlistEvent {
  final ProductDataModel wishlistItems;

  WishRemovedFromWishlistEvent({required this.wishlistItems});
}

class WishlistProductCartButtonClickedEvent extends WishlistEvent {
  final ProductDataModel wishlistItems;

  WishlistProductCartButtonClickedEvent({required this.wishlistItems});
}
