import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final List categories = ['All', 'House', 'Apartment', 'Villa', 'Office'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: index == 0, // Replace with actual logic
              onSelected: (selected) {
                // Handle category selection
              },
            ),
          );
        },
      ),
    );
  }
}