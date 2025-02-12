import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
                theme: ThemeData(
                    appBarTheme: AppBarTheme(
                        color: getThemeColor(
                            BlocProvider.of<GetWeatherCubit>(context)
                                .weatherModel
                                ?.condition)),
                    colorSchemeSeed: getThemeColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.condition)),
                home: HomeScreen());
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.amber;
    case 'Clear':
      return Colors.deepPurple;
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light rain':
    case 'Patchy moderate snow':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blueGrey;
    case 'Ice pellets':
      return Colors.cyan;
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}
