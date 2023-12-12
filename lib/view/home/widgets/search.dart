import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({super.key, required this.search, required this.icon});
  final TextEditingController search;
  final Widget icon;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GlassmorphicContainer(
      height: size.height * 0.07,
      width: size.width * 0.93,
      borderRadius: 20,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
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
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: widget.search,
            decoration: InputDecoration(
              hintText: "Enter a Location",
              contentPadding: const EdgeInsets.all(8),
              hintStyle: TextStyle(
                color: Colors.grey[100],
                fontSize: 16,
              ),
              border: InputBorder.none,
              suffixIcon: widget.icon,
            ),
            style: TextStyle(
              color: Colors.grey[100],
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
