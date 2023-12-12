import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/repository/weather_repo.dart';
import 'package:weather/view/home/widgets/glass_container.dart';
import 'package:weather/view/home/widgets/loading.dart';
import 'package:weather/view/home/widgets/search.dart';
import 'package:weather/view/home/widgets/weather_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _search = TextEditingController();
  late Weather currentWeather;
  bool loaded = false, fav = false;
  List<Weather> favs = [];

  getData(String loc) async {
    setState(() {
      loaded = false;
    });
    currentWeather = await Repository().getWeather(loc);
    print(currentWeather.location);
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    getData("Delhi");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(225, 190, 231, 1),
              Color.fromRGBO(186, 104, 200, 1),
              Color.fromRGBO(156, 39, 176, 1)
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: (loaded == true)
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        SearchWidget(
                          search: _search,
                          icon: GestureDetector(
                            onTap: () {
                              getData(_search.text.trim().toString());
                              if (_search.text.trim().toString() !=
                                  currentWeather.location) {
                                setState(() {
                                  fav = false;
                                });
                              }
                            },
                            child: Icon(
                              Icons.search_outlined,
                              color: Colors.grey[100],
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GlassContainer(
                              height: size.height * 0.35,
                              width: size.width * 0.45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (!fav) favs.add(currentWeather);
                                        fav = true;
                                      });
                                    },
                                    icon: (!fav)
                                        ? const Icon(
                                            Icons.favorite_outline,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                          ),
                                  ),
                                  Text(
                                    currentWeather.temp,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Temparature",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        currentWeather.location,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                GlassContainer(
                                  height: size.height * 0.165,
                                  width: size.width * 0.45,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${currentWeather.humidity}%',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        "Humidity",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                GlassContainer(
                                  height: size.height * 0.165,
                                  width: size.width * 0.45,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            currentWeather.wind,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 32,
                                            ),
                                          ),
                                          const Text(
                                            ' km/h',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        "Wind Speed",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GlassContainer(
                              height: size.height * 0.165,
                              width: size.width * 0.45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    currentWeather.weather,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Weather today",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GlassContainer(
                              height: size.height * 0.165,
                              width: size.width * 0.45,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        currentWeather.desc,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Weather description",
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.01),
                        Container(
                          width: size.width * 0.92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white60,
                              width: 2,
                            ),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFFffffff).withOpacity(0.1),
                                  const Color(0xFFFFFFFF).withOpacity(0.05),
                                ],
                                stops: const [
                                  0.1,
                                  1,
                                ]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: (favs.isNotEmpty)
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Favorites :",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) => Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (favs[index].location ==
                                                      currentWeather.location) {
                                                    fav = false;
                                                  }
                                                  favs.remove(favs[index]);
                                                });
                                              },
                                              child: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                            SizedBox(width: size.width * 0.03),
                                            WeatherListTile(
                                              location: favs[index].location,
                                              desc: favs[index].desc,
                                              weather: favs[index].weather,
                                              temp: favs[index].temp,
                                            ),
                                          ],
                                        ),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                                height: size.height * 0.03),
                                        itemCount: favs.length,
                                      )
                                    ],
                                  )
                                : const Text(
                                    "Add your favorite locations to track.",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      // fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: LoadingWidget(),
                  ),
          ),
        ),
      ),
    );
  }
}
