part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishListActionState extends WishlistState {}

class WishListInitial extends WishlistState {}

class WishListSuccessState extends WishlistState {
  final List<ProductDataModel> WishListItems;
  WishListSuccessState({
    required this.WishListItems,
  });
}
