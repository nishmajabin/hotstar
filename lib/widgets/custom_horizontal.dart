import 'package:flutter/material.dart';

class custom_horizontal extends StatelessWidget {
  const custom_horizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF283955), // Blue color
            Color(0xFF3B2740), // Pink/Magenta color
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 20),
          Text(
            "TV",
            style: TextStyle(
              color: const Color.fromARGB(196, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 20,
            child: VerticalDivider(thickness: 1, width: 25, color: Colors.grey),
          ),
          Text(
            "Movies",
            style: TextStyle(
              color: const Color.fromARGB(196, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 20,
            child: VerticalDivider(thickness: 1, width: 20, color: Colors.grey),
          ),
          Text(
            "Sports",
            style: TextStyle(
              color: const Color.fromARGB(196, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 20,
            child: VerticalDivider(thickness: 1, width: 20, color: Colors.grey),
          ),
          Row(
            children: [
              Text(
                "More",
                style: TextStyle(
                  color: const Color.fromARGB(196, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),

              Transform.rotate(
                angle: -1.57, // -90 degrees in radians
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '>',
                    style: TextStyle(
                      color: const Color.fromARGB(196, 255, 255, 255),
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
