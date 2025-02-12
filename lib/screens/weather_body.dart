import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    String weatherImage = "https:${weatherModel.image}";
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(weatherModel.condition),
            getThemeColor(weatherModel.condition).shade50,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.city,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Text(
                '${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
              ),
              SizedBox(height: 38),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(weatherImage),
                  Text(
                    '${weatherModel.temp.round()}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Column(
                    children: [
                      Text(
                        'min temp: ${weatherModel.minTemp.round()}',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      Text(
                        'max temp: ${weatherModel.maxTemp.round()}',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 38),
              Text(
                weatherModel.condition,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
