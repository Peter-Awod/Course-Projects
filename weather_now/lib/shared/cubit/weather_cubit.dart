import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';
import 'weather_states.dart';

class WeatherCubit extends Cubit<WeatherStstes> {
  WeatherCubit() :super(InitialWeatherState());
  WeatherCubit get(context)=>BlocProvider.of(context);

  WeatherModel? weatherModel;
  getWeather({required cityName})async{

    try {
       weatherModel =
      await WeatherService(dio: Dio()).getCurrentWeather(cityName);
      emit(GetWeatherSuccessState());
    } catch (e) {

      print(e.toString());
      emit(GetWeatherFailureState());
    }
  }
}
