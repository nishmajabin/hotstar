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

class WidgetCategoryDot extends StatelessWidget {
  const WidgetCategoryDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCategory('1Cr Views'),
        buildDot(),
        buildCategory('Fukra Insaan'),
        buildDot(),
        buildCategory('Hindi'),
        buildDot(),
        buildCategory('Game Show'),
      ],
    );
  }
}
