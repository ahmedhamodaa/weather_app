import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '6439a6f1732d4ca6ba101115243112';

  Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      String errorMessage = e.response?.data['error']['code'] ??
          'oops, there was an ERROR, try again later.';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops, there was an ERROR, try again later.');
    }
  }
}
