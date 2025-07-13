import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withAlpha(153),
            Colors.black,
          ],
        ),
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final int count;
  const CircleContainer({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10, // Position from bottom
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 0 ? Colors.white : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCircularLoading extends StatelessWidget {
  const CustomCircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Color.fromARGB(255, 188, 188, 188),
        strokeWidth: 2,
      ),
    );
  }
}
