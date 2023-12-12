import 'package:flutter/material.dart';

class WeatherListTile extends StatelessWidget {
  const WeatherListTile(
      {super.key,
      required this.location,
      required this.desc,
      required this.weather,
      required this.temp});
  final String location, desc, weather, temp;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.71,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.4),
            const Color(0xFFFFFFFF).withOpacity(0.2),
          ],
          stops: const [
            0.1,
            1,
          ],
        ),
      ),
      child: ListTile(
        title: Text(
          location,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          '$weather : $desc',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        trailing: Text(
          '$temp ℃',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
        leading: const Icon(
          Icons.cloud_outlined,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
