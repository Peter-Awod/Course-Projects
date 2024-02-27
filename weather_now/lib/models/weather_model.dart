class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final String weatherCondition;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.weatherCondition,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}
