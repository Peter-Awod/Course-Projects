import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_now/models/weather_model.dart';
import 'package:weather_now/services/weather_service.dart';
import 'package:weather_now/shared/cubit/weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            label: Text('Search'),
            hintText: 'Enter a city',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onFieldSubmitted: (cityName) async {
           var cubitVar= BlocProvider.of<WeatherCubit>(context);

           await cubitVar.getWeather(cityName: cityName);
           Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
