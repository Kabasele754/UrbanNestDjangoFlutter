import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/review_bloc.dart';
import '../services/api_service.dart';
import '../models/review.dart';

class ReviewList extends StatelessWidget {
  final String listingId;

  ReviewList({required this.listingId});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService(); // Assurez-vous que c'est la manière appropriée pour obtenir une instance d'ApiService dans votre contexte

    return BlocProvider(
      create: (context) => ReviewBloc(apiService)..add(FetchReviews(listingId)),
      child: BlocBuilder<ReviewBloc, ReviewState>(
        builder: (context, state) {
          if (state is ReviewLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ReviewLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Reviews', style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: 8),
                ...state.reviews.map((review) => _buildReviewItem(review)).toList(),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Text('Add Review'),
                  onPressed: () {
                    // Navigate to add review screen
                  },
                ),
              ],
            );
          } else if (state is ReviewError) {
            return Text('Error: ${state.message}');
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildReviewItem(Review review) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(review.username, style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text('${review.rating}/5'),
              ],
            ),
            SizedBox(height: 4),
            Text(review.content),
          ],
        ),
      ),
    );
  }
}
