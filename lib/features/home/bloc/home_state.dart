part of 'home_bloc.dart';

abstract class HomeState {}

abstract class HomeActionsState extends HomeState {}

final class CoinInitial extends HomeState {}

class CoinloadedState extends HomeState {}

class CoinloadedeSucessState extends HomeState {
  List<CoinModel> coins = [];
  CoinloadedeSucessState({required this.coins});
}

class CoinErrorState extends HomeState {
  String? error = '';
  CoinErrorState({this.error});
}

final class CointainTrueMessageState extends HomeActionsState {}

class SocketExceptionstate extends HomeState {}

class CoinAddedMessageState extends HomeActionsState {}
