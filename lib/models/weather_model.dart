class WeatherModel {
  final String city;
  final DateTime date;
  final String? image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String condition;

  WeatherModel(
      {required this.city,
      required this.date,
      required this.image,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.condition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['current']['condition']['icon'],
      temp: json['current']['temp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      condition: json['current']['condition']['text'],
    );
  }
}
