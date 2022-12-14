part of 'card_hs_cubit.dart';

abstract class CardHSState {
  const CardHSState();
}

class CardHSInitial extends CardHSState {}

class CardHSLoading extends CardHSState {}

class CardHSLoaded extends CardHSState {
  const CardHSLoaded(this.cards);

  final List<CardHS> cards;
}