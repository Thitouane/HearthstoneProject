import 'dart:io' show Platform, exit;

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet/data/cubit/card/card_hs_cubit.dart';
import 'package:projet/view/widget/hearthstone_card_widget.dart';
import 'package:projet/view/widget/search_card_widget.dart';

import 'package:projet/data/cubit/info/info_cubit.dart';

class HomePage extends StatelessWidget {
  final String? set;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({super.key, this.set});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CardHSCubit()..getFromSet(),
        ),
        BlocProvider(
          create: (context) => InfoCubit()..getSets(),
        ),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        drawer: _navBar(context),
        appBar: AppBar(
          backgroundColor: Colors.brown,
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
            child: BlocBuilder<InfoCubit, InfoState>(
              builder: (context, state) {
                List<dynamic> setList = [];
                if (state is InfoLoaded) {
                  setList = state.sets;
                  return Container(
                    height: 50,
                    color: Colors.white.withOpacity(0.7),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var set in setList) _singleItem(context, set)
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            )
          ),
        ),
        body: BlocBuilder<CardHSCubit, CardHSState>(
          builder: (context, state) {
            return _getBody(context, state);
          }
        )
      )
    );
  }

  Widget _getBody(BuildContext context, CardHSState state) {
    if (state is CardHSLoaded) {
      if (state.cards.isEmpty) {
        return const Center(
          child: Text("empty set"),
        );
      } else {
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
      }
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
          searchItem
        ),
    );
  }

  Widget _navBar(BuildContext context) {
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
                      leading: const Icon(Icons.dark_mode),
                      title: const Text('Dark Mode'),
                      onTap: () {
                        AdaptiveTheme.of(context).toggleThemeMode();
                      }
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Quit'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: const Text(
                                  kIsWeb
                                    ? 'Close with the red cross in the top corner'
                                    : 'Are you sure ?'
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            if (Platform.isAndroid) {
                                              SystemNavigator.pop();
                                            } else if (Platform.isIOS) {
                                              exit(0);
                                            }
                                          },
                                          child: const Text('Yes'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('No'),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                            );
                          }
                        );
                    }
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