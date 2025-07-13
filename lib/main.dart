import 'package:flutter/material.dart';
import 'package:hotstar_clone/screens/splash/splash_screen.dart';

main(){
  runApp(HotstarClone());
}

class HotstarClone extends StatelessWidget {
  const HotstarClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
