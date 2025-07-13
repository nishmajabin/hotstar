import 'package:flutter/material.dart';
import 'package:hotstar_clone/widgets/bottom.dart';
import 'package:hotstar_clone/widgets/colors.dart';


class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.fromLTRB(15, 16, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Downloads',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Content
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 40, left: 40, top: 130),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Static Box Icon
                      Center(
                        child: Image(
                          image: AssetImage('assets/images/download.jpg'),
                          width: 200,
                          height: 200,
                        ),
                      ),

                      // Main Text
                      Text(
                        'No Downloads Available',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 8),

                      // Sub Text
                      Text(
                        'Explore and download your favourite movies and shows to watch on the go',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),

                      SizedBox(height: 15),

                      // Home Button
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(maxWidth: 400),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        CustomBottomNavigate(initialIndex: 0),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF333333),
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Go to Home',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
