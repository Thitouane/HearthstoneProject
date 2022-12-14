import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet/data/cubit/favorite/favorite_cubit.dart';
import 'package:projet/data/cubit/favorite/favorite_state.dart';
import 'package:projet/data/favorite_repo.dart';
import '../data/cubit/favorite/favorite_event.dart';
import 'widget/hearthstone_card_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FavoriteBloc(
            favoriteRepository: FavoriteRepository()
        )..add(GetData()),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown,
              title: const Text('Favorite'),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  AutoRouter.of(context).pushNamed("/");
                },
              ),
            ),
            body: _getBody(context, state),
        );
        }
      )
    );
  }

  Widget _getBody(BuildContext context, FavoriteState state) {
    if (state is FavoriteLoaded) {
      return OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              ),
              itemCount: state.cards.length,
              itemBuilder: (context, index) {
                return HearthstoneCardWidget(
                    card: state.cards[index]
                );
              }
          );
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

}