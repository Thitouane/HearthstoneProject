part of 'info_cubit.dart';

abstract class InfoState {
  const InfoState();
}

class InfoInitial extends InfoState {}

class InfoLoading extends InfoState {}

class InfoLoaded extends InfoState {
  const InfoLoaded(this.sets);

  final List<dynamic> sets;
}