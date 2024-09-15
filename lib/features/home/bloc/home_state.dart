part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Toncoin toncoin;
  final double last;
  HomeLoaded({
    required this.toncoin,
    required this.last,
  });
}

class HomeError extends HomeState {}
