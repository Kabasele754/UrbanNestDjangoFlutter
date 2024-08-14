import 'package:flutter/material.dart';
import '../models/listing.dart';
import '../widgets/review_list.dart';

class ListingDetailScreen extends StatelessWidget {
  final Listing listing;

  ListingDetailScreen({required this.listing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(listing.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(listing.imageUrl),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listing.title, style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 8),
                  Text('${listing.price} €', style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: 16),
                  Text(listing.description, style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 16),
                  Text('Details:', style: Theme.of(context).textTheme.titleSmall),
                  Text('Bedrooms: ${listing.bedrooms}'),
                  Text('Bathrooms: ${listing.bathrooms}'),
                  Text('Area: ${listing.area} m²'),
                  Text('Address: ${listing.address}, ${listing.city}'),
                  SizedBox(height: 16),
                  ReviewList(listingId: listing.id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
