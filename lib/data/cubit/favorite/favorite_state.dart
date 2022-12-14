import 'package:projet/data/models/card_hs.dart';

abstract class FavoriteState {
  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {}

class FavoriteError extends FavoriteState {
  final String error;
  FavoriteError(this.error);

  @override
  List<Object> get props => [error];
}

class FavoriteLoading extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class FavoriteLoaded extends FavoriteState {
  List<CardHS> cards;
  FavoriteLoaded(this.cards);

  @override
  List<Object?> get props => [];
}

class FavoriteAdded extends FavoriteState {
  CardHS card;
  FavoriteAdded(this.card);

  @override
  List<Object?> get props => [];
}