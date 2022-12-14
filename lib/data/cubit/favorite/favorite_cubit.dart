import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet/data/cubit/favorite/favorite_event.dart';
import 'package:projet/data/cubit/favorite/favorite_state.dart';

import 'package:projet/data/favorite_repo.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository favoriteRepository;
  FavoriteBloc({required this.favoriteRepository}) : super(FavoriteInitial()) {
    on<GetData>((event, emit) async {
      emit(FavoriteLoading());
      try {
        final data = await favoriteRepository.get();
        emit(FavoriteLoaded(data));
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<AddData>((event, emit) async {
      emit(FavoriteLoading());
      try {
        await favoriteRepository.add(event.card);
        emit(FavoriteLoaded([event.card]));
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<DelData>((event, emit) async {
      emit(FavoriteLoading());
      try {
        await favoriteRepository.del(event.card);
        emit(FavoriteLoaded([event.card]));
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<GetOneData>((event, emit) async {
      try {
        await favoriteRepository.getId(event.card);
        emit(FavoriteAdded(event.card));
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });
  }
}