import 'package:flutter/material.dart';
import 'package:real_estate_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:real_estate_app/widgets/category_selector.dart';
import 'package:real_estate_app/widgets/listing_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Estate'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual listing count
              itemBuilder: (context, index) {
                return ListingCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
