import 'package:flutter/material.dart';

Widget buildActionButton(IconData icon, String label) {
  return Column(
    children: [
      Icon(icon, color: Colors.white, size: 19),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
