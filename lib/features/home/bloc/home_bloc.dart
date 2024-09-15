import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/toncoin.dart';
import '../repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = HomeRepository();

  HomeBloc() : super(HomeInitial()) {
    on<GetDataEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();

      double last = prefs.getDouble('last') ?? 0;

      emit(HomeLoading());

      Result result = await _repository.getToncoinRate();

      if (result is SuccessResult) {
        prefs.setDouble('last', result.toncoin.price);

        log(last.toString());
        log(result.toncoin.price.toString());

        emit(HomeLoaded(
          toncoin: result.toncoin,
          last: last,
        ));
      } else {
        emit(HomeError());
      }
    });
  }
}
