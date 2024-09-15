import 'dart:developer';

import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/toncoin.dart';

class HomeRepository {
  final _dio = Dio();

  Future<Result> getToncoinRate() async {
    // dotenv.env['BOT_TOKEN'];

    try {
      final response = await _dio.get(
        'https://tonapi.io/v2/rates?tokens=ton&currencies=usd',
      );

      log(response.data.toString());

      if (response.statusCode == 200) {
        return SuccessResult(toncoin: Toncoin.fromJson(response.data));
      } else {
        return ErrorResult();
      }
    } catch (e) {
      log(e.toString());
      return ErrorResult();
    }
  }
}

abstract class Result {}

class SuccessResult extends Result {
  final Toncoin toncoin;
  SuccessResult({required this.toncoin});
}

class ErrorResult extends Result {}
