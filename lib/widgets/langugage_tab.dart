import 'package:flutter/material.dart';

class LanguageTabs extends StatefulWidget {
  final List<String> languages;
  final Color selectedColor;
  final Color unselectedColor;
  final Color borderColor;
  final double fontSize;
  final double padding;
  final double borderRadius;

  const LanguageTabs({
    super.key,
    required this.languages,
    this.selectedColor = Colors.grey, // Default selected color
    this.unselectedColor = Colors.black, // Default unselected color
    this.borderColor = Colors.white, // Default border color
    this.fontSize = 14,
    this.padding = 12,
    this.borderRadius = 8,
  });

  @override
  _LanguageTabsState createState() => _LanguageTabsState();
}

class _LanguageTabsState extends State<LanguageTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.languages.length,
            itemBuilder: (context, index) {
              bool isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: widget.padding, vertical: 6),
                  margin: const EdgeInsets.only(left: 4, right: 4),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? widget.selectedColor
                        : widget.unselectedColor,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    border: Border.all(
                      color:
                          isSelected ? widget.borderColor : Colors.grey[700]!,
                    ),
                  ),
                  child: Text(
                    widget.languages[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey[400],
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}