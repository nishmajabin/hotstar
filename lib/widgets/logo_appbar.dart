import 'package:flutter/material.dart';

class LogoAppbar extends StatelessWidget {
  const LogoAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: SizedBox(
            width: 44,
            height: 44,
            child: Image(image: AssetImage('assets/images/logo.png')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(Icons.cast, color: Colors.white, size: 26),
        ),
      ],
    );
  }
}
