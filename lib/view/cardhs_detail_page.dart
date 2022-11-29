import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projet/data/cubit/card_hs_cubit.dart';
import 'package:projet/models/card_hs.dart';

class CardHSDetailPage extends StatelessWidget {
  final CardHS card;

  const CardHSDetailPage({
    Key? key,
    required this.card
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CardHSCubit(),
        child: BlocBuilder<CardHSCubit, CardHSState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  '${card.name}'
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: 'HearthstoneCard-${card.cardId}',
                      child: Image.network(
                          card.img ?? ""
                      ),
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(card.flavor ?? ""),
                      Text(card.artist ?? "")
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(card.howToGet ?? ""),
                      Text(card.howToGetGold ?? "")
                    ],
                  ),
                  IconButton(
                      icon: card.isFavorite == true
                          ? const Icon(Icons.favorite, color: Colors.red,)
                          : const Icon(Icons.favorite_border),
                      onPressed: () {
                        //context.read<CardHSCubit>().toggleFavorite(cardId);
                      }
                  )
                ],
              ),
            ),
          );
        }
        )
    );
  }
}