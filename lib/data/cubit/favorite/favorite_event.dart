import 'package:equatable/equatable.dart';
import 'package:projet/data/models/card_hs.dart';

abstract class FavoriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddData extends FavoriteEvent {
  final CardHS card;

  AddData(this.card);
}

class DelData extends FavoriteEvent {
  final CardHS card;

  DelData(this.card);
}

class GetData extends FavoriteEvent {
  GetData();
}

class GetOneData extends FavoriteEvent {
  final CardHS card;

  GetOneData(this.card);
}