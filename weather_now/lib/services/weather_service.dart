import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '930a8610ef8e4550a84165719230312';

  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      Response response = await dio
          .get('${baseUrl}/forecast.json?key=${apiKey}&q=${cityName}&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      // TODO
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops there was an error';
      log(errorMessage);

      throw Exception(e.toString());
    }catch (e){
      log(e.toString());
      throw Exception('Oops there was an error, try later');
    }
  }
}
