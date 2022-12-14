import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:projet/data/models/info.dart';

part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  static const apiURL = 'https://omgvamp-hearthstone-v1.p.rapidapi.com';
  InfoCubit()
      : super(InfoInitial());

  getSets() async {
    emit(InfoLoading());

    var response = await Dio().get(
        '$apiURL/info',
        options: Options(
          headers: {
            "X-RapidAPI-Key": "3144cd28fcmsh50433986344defbp1a22c7jsn2991180a2de9",
            "X-RapidAPI-Host": "omgvamp-hearthstone-v1.p.rapidapi.com"
          },
        )
    );

    emit(InfoLoaded(response.data['sets']));
  }
}
