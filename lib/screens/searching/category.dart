import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
   List<String> trendingCategories = [
    'India',
    'Movies',
    'Shows',
    'Action',
    'Comedy',
    'Crime',
    'Drama',
    'Romance',
    'Thriller',
    'Horror',
  ];

  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: trendingCategories.length,
              itemBuilder: (context, index) {
                bool isSelected = index == selectedCategoryIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 9),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(123, 38, 50, 56),
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // More rounded like in image
                      border: Border.all(
                        color:
                            isSelected
                                ? Colors.white
                                : const Color.fromARGB(255, 60, 59, 59),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (index == 0)
                          Padding(
                            padding: EdgeInsets.only(right: 6),
                            child: Icon(
                              Icons.trending_up,
                              size: 14,
                              color:
                                  isSelected ? Colors.white : Color(0xFF8D95AA),
                            ),
                          ),
                        Text(
                          trendingCategories[index],
                          style: TextStyle(
                            color:
                                isSelected ? Colors.white : Color(0xFF78909C),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}