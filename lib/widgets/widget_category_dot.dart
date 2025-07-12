import 'package:flutter/material.dart';

Widget buildCategory(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget buildDot() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Text(
      '•',
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
