import 'package:flutter/material.dart';
import 'package:hotstar_clone/widgets/bottom.dart';
import 'package:hotstar_clone/widgets/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CustomBottomNavigate()),
      );
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color1, color2, color3],
            // stops: [0.0, 0.5, 1],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Text(
                'JioHotstar',
                style: TextStyle(
                  fontSize: 53,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 219, 219, 219),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
