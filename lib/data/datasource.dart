import 'dart:convert';

import 'package:http/http.dart' as http;

class DataSource {
  //fetches data from the api's
  Future<dynamic> getWeather(String loc) async {
    final res = await http.get(
      Uri.parse('https://open-weather13.p.rapidapi.com/city/$loc'),
      headers: {
        'X-RapidAPI-Key': '52da2f9918msha1289bc9587d0e9p14bd67jsn15aa621a8d85',
        'X-RapidAPI-Host': 'open-weather13.p.rapidapi.com'
      },
    );

    return jsonDecode(res.body);
  }
}
