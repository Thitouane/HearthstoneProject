import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet/view/home_page.dart';
import '../models/card_hs.dart';
import 'hearthstone_card_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hearthstone favorite'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            AutoRouter.of(context).pushNamed("/");
          },
        ),
      ),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Text("fav");
  }

}