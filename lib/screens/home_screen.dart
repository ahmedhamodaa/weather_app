import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screens/no_weather_body.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.condition),
              getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition)
                  .shade50,
            ],
          ),
        ),
        child: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherBody(
                weather: state.weatherModel,
              );
            } else {
              return Text('Oops, there was an error.');
            }
          },
        ),
      ),
    );
  }
}
