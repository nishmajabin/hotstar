import 'package:flutter/material.dart';

class WatchnowButton extends StatelessWidget {
  const WatchnowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 230, // Full width like in the image
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1083EE), // Blue
                Color(0xFFF50057), // Pink/Magenta
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.5, 1.0],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: Icon(Icons.play_arrow, color: Colors.white, size: 21),
            label: Text(
              'Watch Now',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        SizedBox(
          width: 45,
          height: 45,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 51, 51, 51),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 24),
          ),
        ),
      ],
    );
  }
}
