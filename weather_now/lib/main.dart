import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_now/shared/cubit/weather_cubit.dart';
import 'package:weather_now/shared/cubit/weather_states.dart';

import 'bloc_observer.dart';
import 'layouts/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(
        builder: (context)=>BlocBuilder<WeatherCubit,WeatherStstes>(
          builder: (context, state) => MaterialApp(
            theme: ThemeData(
              primarySwatch: getThemeColor(
                BlocProvider.of<WeatherCubit>(context)
                    .weatherModel?.weatherCondition,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          ),
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.yellow;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.grey;
    case 'patchy rain possible':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'blowing snow':
    case 'blizzard':
      return Colors.grey;
    case 'fog':
    case 'freezing fog':
      return Colors.grey;
    case 'patchy light drizzle':
    case 'light drizzle':
      return Colors.lightBlue;
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
      return Colors.blue;
    case 'patchy light rain':
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain at times':
    case 'moderate rain':
      return Colors.blue;
    case 'heavy rain at times':
    case 'heavy rain':
      return Colors.indigo;
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.lightBlue;
    case 'patchy light snow':
    case 'light snow':
      return Colors.lightBlue;
    case 'patchy moderate snow':
    case 'moderate snow':
      return Colors.blue;
    case 'patchy heavy snow':
    case 'heavy snow':
      return Colors.indigo;
    case 'ice pellets':
      return Colors.lightBlue;
    case 'light rain shower':
      return Colors.lightBlue;
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
      return Colors.indigo;
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'light snow showers':
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}
