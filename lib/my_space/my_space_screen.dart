import 'package:flutter/material.dart';
import 'package:hotstar_clone/widgets/colors.dart';

class MySpaceScreen extends StatelessWidget {
  const MySpaceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          Stack(
            children: [
              // Full screen gradient background
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF01001F), Color(0xFF1F010D)],
                  ),
                ),
              ),

              // Top bar with logo and settings
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 40,
                      width: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Help & Settings',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Center content
              Positioned(
                top: 110,
                right: 50,
                left: 50,
                child: SizedBox(
                  width: 190,
                  height: 110,
                  child: Image.asset(
                    'assets/images/space.jpg', // Replace with your image path
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Title
              Positioned(
                top: 230,
                left: 150,
                child: Text(
                  'Login to JioHotstar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Subtitle
              Positioned(
                top: 252,
                left: 30,
                child: Text(
                  'Start watching from where you left off, personalise for kids and more',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromARGB(208, 189, 189, 189),
                    fontSize: 11,
                  ),
                ),
              ),

              Positioned(
                bottom: 70,
                left: 110,
                child: Container(
                  width: 205,
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
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // Help text
              Positioned(
                bottom: 45,
                left: 135,

                child: RichText(
                  text: TextSpan(
                    text: 'Having trouble logging in? ',
                    style: TextStyle(color: Colors.grey[500], fontSize: 9.5),
                    children: [
                      TextSpan(
                        text: 'Get Help',
                        style: TextStyle(
                          color: Color(0xFF1083EE),
                          fontSize: 9.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
