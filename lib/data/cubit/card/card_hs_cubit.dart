import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:projet/data/models/card_hs.dart';
import 'package:projet/data/models/info.dart';

part 'card_hs_state.dart';

class CardHSCubit extends Cubit<CardHSState> {
  static const apiURL = 'https://omgvamp-hearthstone-v1.p.rapidapi.com';
  CardHSCubit()
      : super(CardHSInitial());

  getFromSet({
    set = 'Classic'
  }) async {
    emit(CardHSLoading());

    var response = await Dio().get(
    '$apiURL/cards/sets/$set?locale=frFR',
        options: Options(
          headers: {
            "X-RapidAPI-Key": "3144cd28fcmsh50433986344defbp1a22c7jsn2991180a2de9",
            "X-RapidAPI-Host": "omgvamp-hearthstone-v1.p.rapidapi.com"
          },
        )
    );

    List<CardHS> cards = [];
    for (int i = 0; i < response.data.length; i ++) {
      CardHS card = CardHS.fromJson(response.data[i]);
      if (card.img != null) {
        cards.add(card);
      }
    }
    emit(CardHSLoaded(cards));
  }

  getByName({
    name = 'Ysera'
  }) async {
    emit(CardHSLoading());

    var response = await Dio().get(
        '$apiURL/cards/search/$name?locale=frFR',
        options: Options(
          headers: {
            "X-RapidAPI-Key": "3144cd28fcmsh50433986344defbp1a22c7jsn2991180a2de9",
            "X-RapidAPI-Host": "omgvamp-hearthstone-v1.p.rapidapi.com"
          },
        )
    );

    List<CardHS> cards = [];
    for (int i = 0; i < response.data.length; i ++) {
      CardHS card = CardHS.fromJson(response.data[i]);
      if (card.img != null) {
        cards.add(card);
      }
    }
    emit(CardHSLoaded(cards));
  }
}
