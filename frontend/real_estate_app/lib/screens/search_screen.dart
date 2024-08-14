import 'package:flutter/material.dart';
import 'package:real_estate_app/widgets/listing_card.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual search results count
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