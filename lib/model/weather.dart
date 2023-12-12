// Main class for the weather model
class Weather {
  final String location;
  final String temp;
  final String weather;
  final String wind;
  final String humidity;
  final String desc;

  Weather({
    required this.location,
    required this.temp,
    required this.weather,
    required this.desc,
    required this.humidity,
    required this.wind,
  });

  static Weather fromJson(dynamic json) {
    return Weather(
      location: json['name'].toString(),
      temp: json['main']['temp'].toString(),
      humidity: json['main']['humidity'].toString(),
      weather: json['weather'][0]['main'].toString(),
      wind: json['wind']['speed'].toString(),
      desc: json['weather'][0]['description'].toString(),
    );
  }
}
