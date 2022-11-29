import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet/view/routing/router.gr.dart';

import '../data/cubit/card_hs_cubit.dart';
import '../models/card_hs.dart';

class HearthstoneCardWidget extends StatelessWidget {
  final CardHS card;

  const HearthstoneCardWidget({
    Key? key,
    required this.card
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CardHSCubit()..getByName(
            name: card.cardId
        ),
        child: BlocBuilder<CardHSCubit, CardHSState>(
            builder: (context, state) {
              return InkWell(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            '${card.name}',
                            textAlign: TextAlign.center,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Hero(
                                tag: 'HearthstoneCard-${card.cardId}',
                                child: Image.network(
                                  card.img!
                                )
                              ),
                            ),
                          ),
                          IconButton(
                              icon: card.isFavorite == true
                                  ? const Icon(
                                Icons.favorite, color: Colors.red,)
                                  : const Icon(Icons.favorite_border),
                              onPressed: () {
                                /*context.read<CardHSCubit>().toggleFavorite(card
                                    .cardId);*/
                              }
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    context.router.push(CardHSDetailRoute(card: card));
                  }
              );
            })
    );
  }
}