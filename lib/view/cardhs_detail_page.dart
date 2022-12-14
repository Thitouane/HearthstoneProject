import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vibration/vibration.dart';
import 'package:projet/data/cubit/favorite/favorite_cubit.dart';
import 'package:projet/data/cubit/favorite/favorite_event.dart';
import 'package:projet/data/cubit/favorite/favorite_state.dart';
import 'package:projet/data/models/card_hs.dart';

import '../data/favorite_repo.dart';

class CardHSDetailPage extends StatefulWidget {
  final CardHS card;

  const CardHSDetailPage({
    Key? key,
    required this.card
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarteHSDetailState();
  }
}

class _CarteHSDetailState extends State<CardHSDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FavoriteBloc(
            favoriteRepository: FavoriteRepository()
        ),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown,
              title: Text(
                  '${widget.card.name}'
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Hero(
                          tag: 'HearthstoneCard-${widget.card.cardId}',
                          child: Image.network(
                              widget.card.img ?? ""
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0.0,
                        bottom: 0.0,
                        child: FavoriteButton(context, state),
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Set: ${widget.card.cardSet}" ?? "...",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 10
                        ),
                      ),
                      Text(
                        "Artiste: ${widget.card.artist}" ?? "...",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ]
                  ),
                  const Divider(),
                  Card(
                    child: ListTile(
                      title: Text(
                        widget.card.flavor ?? "...",
                        textAlign: TextAlign.start,
                      ),
                    )
                  ),
                  Card(
                      child: ListTile(
                        title: const Text(
                          "Comment avoir la carte ?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 10
                          ),
                        ),
                        subtitle: Text(
                          widget.card.howToGet ?? "...",
                          textAlign: TextAlign.start,
                        ),
                      )
                  ),
                  Card(
                      child: ListTile(
                        title: const Text(
                          "Comment avoir la carte en or ?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 10
                          ),
                        ),
                        subtitle: Text(
                          widget.card.howToGetGold ?? "...",
                          textAlign: TextAlign.start,
                        ),
                      )
                  ),
                ],
              ),
            ),
          );
        }
        )
    );
  }

  Widget FavoriteButton(BuildContext context, FavoriteState state) {
    BlocProvider.of<FavoriteBloc>(context).add(GetOneData(widget.card));

    if(state is FavoriteAdded) {
      return FloatingActionButton(
          backgroundColor: Colors.brown,
          onPressed: () {
            context.read<FavoriteBloc>().add(DelData(widget.card));
            Vibration.vibrate();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("deleted from favorite"),
            ));
          },
          child: const Icon(Icons.favorite)
      );
    } else {
      return FloatingActionButton(
          backgroundColor: Colors.brown,
          onPressed: () {
            context.read<FavoriteBloc>().add(AddData(widget.card));
            Vibration.vibrate();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("added to favorite"),
            ));
          },
          child: const Icon(Icons.favorite_border)
      );
    }

  }
}