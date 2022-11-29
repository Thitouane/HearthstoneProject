import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet/data/cubit/card_hs_cubit.dart';
import 'package:projet/view/hearthstone_card_widget.dart';
import 'package:projet/view/search_card_widget.dart';

class HomePage extends StatelessWidget {
  final String? set;

  HomePage({super.key, this.set});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //get from info
  static const List<String> dropdownList = <String>[
    "Classic",
    "Basic",
    "Hall of Fame",
    "Missions",
    "Demo",
    "System",
    "Slush",
    "Promo",
    "Naxxramas",
    "Goblins vs Gnomes",
    "Blackrock Mountain",
    "The Grand Tournament",
    "Credits",
    "Hero Skins",
    "Tavern Brawl",
    "The League of Explorers",
    "Whispers of the Old Gods",
    "Whispers of the Old Gods",
    "One Night in Karazhan",
    "One Night in Karazhan",
    "Mean Streets of Gadgetzan",
    "Mean Streets of Gadgetzan",
    "Journey to Un'Goro",
    "Knights of the Frozen Throne",
    "Kobolds & Catacombs",
    "The Witchwood",
    "The Boomsday Project",
    "Rastakhan's Rumble",
    "Rise of Shadows",
    "Taverns of Time",
    "Saviors of Uldum",
    "Descent of Dragons",
    "Galakrond's Awakening",
    "Ashes of Outland",
    "Wild Event",
    "Scholomance Academy",
    "Battlegrounds",
    "Demon Hunter Initiate",
    "Madness at the Darkmoon Faire",
    "Forged in the Barrens",
    "Legacy",
    "Core",
    "Classic",
    "Wailing Caverns",
    "United in Stormwind",
    "Mercenaries",
    "Fractured in Alterac Valley",
    "Voyage to the Sunken City",
    "Unknown",
    "Murder at Castle Nathria",
    "March of the Lich King"
  ];

  String dropdownValue = dropdownList.first;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardHSCubit()..getFromSet(),
      child: BlocBuilder<CardHSCubit, CardHSState>(
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            drawer: NavBar(context),
            appBar: AppBar(
              title: const Text('Hearthstone search'),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: SearchCard()
                    );
                  },
                )
              ],
              bottom: PreferredSize(
                  preferredSize: const Size(3, 50),
                  child: Container(
                    height: 50,
                    color: Colors.white.withOpacity(0.7),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var set in dropdownList) _singleItem(context, set)
                        ],
                      ),
                    ),
                  )
              ),
            ),
            body: _getBody(context, state),
          );
        }
      )
    );
  }

  Widget _getBody(BuildContext context, CardHSState state) {
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
  }

  Widget _singleItem(BuildContext context, String searchItem) {
    return TextButton(
      onPressed: () {
        BlocProvider.of<CardHSCubit>(context).getFromSet(
            set: searchItem
        );
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.brown,
      ),
      child: Text(
          searchItem,
          style: const TextStyle(color: Colors.white),
        ),
    );
  }

  Widget NavBar(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Accueil'),
                      onTap: () {
                        AutoRouter.of(context).pop();
                        AutoRouter.of(context).pushNamed("/");
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.search),
                      title: const Text('Search'),
                      onTap: () {
                        showSearch(
                            context: context,
                            delegate: SearchCard()
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite),
                      title: const Text('Favorite'),
                      onTap: () {
                        AutoRouter.of(context).pushNamed("/favorite-page");
                      },
                    ),
                  ],
                )
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Quit'),
                      onTap: () {
                        AutoRouter.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}