import 'package:weather/data/datasource.dart';
import 'package:weather/model/weather.dart';

class Repository {
  Future<Weather> getWeather(String loc) async {
    //converts the response body to wether class object
    dynamic res = await DataSource().getWeather(loc);
    Weather w = Weather.fromJson(res);
    return w;
  }
}
