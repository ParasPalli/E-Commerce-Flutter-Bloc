import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_tutorial/features/wishlist/ui/wishlist_title_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishBloc = WishlistBloc();
  @override
  void initState() {
    wishBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Favorite Items'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishListActionState,
        buildWhen: (previous, current) => current is! WishListActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListSuccessState:
              final successState = state as WishListSuccessState;
              return ListView.builder(
                  itemCount: successState.WishListItems.length,
                  itemBuilder: (context, index) {
                    return WishTileWidget(
                      wishBloc: wishBloc,
                      productDataModel: successState.WishListItems[index],
                    );
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}
