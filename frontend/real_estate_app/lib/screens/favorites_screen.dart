import 'package:flutter/material.dart';
import 'package:real_estate_app/widgets/listing_card.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: ListView.builder(
        itemCount: 5, // Replace with actual favorites count
        itemBuilder: (context, index) {
          return ListingCard();
        },
      ),
    );
  }
}