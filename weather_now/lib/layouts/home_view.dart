import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_now/modules/search/search_screen.dart';
import 'package:weather_now/modules/weather/weather_info_body.dart';
import 'package:weather_now/shared/cubit/weather_cubit.dart';
import 'package:weather_now/shared/cubit/weather_states.dart';

import '../modules/weather/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon:const Icon(Icons.search_outlined),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit,WeatherStstes>(
        builder: (context, state) {
          if(state is InitialWeatherState)
            {
              return const NoWeatherBody();
            }
          else if(state is GetWeatherSuccessState)
          {
            return WeatherInfoBody();
          }
          else if(state is GetWeatherFailureState){
            return const Text('Oops there is failure state, please try later ');

          }
          else{
            return const Text('Oops there is an error, please try later ');
          }
        },
      ),
    );
  }
}
