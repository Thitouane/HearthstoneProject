import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/cubit/card_hs_cubit.dart';
import 'hearthstone_card_widget.dart';

class SearchCard extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close)
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
        create: (context) => CardHSCubit()..getByName(
            name: query
        ),
        child: BlocBuilder<CardHSCubit, CardHSState>(
            builder: (context, state) {
              if (state is CardHSLoaded) {
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3
                    ),
                    itemCount: state.cards.length,
                    itemBuilder: (context, index) {
                      return HearthstoneCardWidget(
                          card: state.cards[index]
                      );
                    }
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
        })
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Hearthstone Card'),
    );
  }
}