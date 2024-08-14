import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import '../models/review.dart';

// Events
abstract class ReviewEvent {}

class FetchReviews extends ReviewEvent {
  final String listingId;

  FetchReviews(this.listingId);
}

class AddReview extends ReviewEvent {
  final Review review;

  AddReview(this.review);
}

// States
abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewLoaded extends ReviewState {
  final List<Review> reviews;

  ReviewLoaded(this.reviews);
}

class ReviewError extends ReviewState {
  final String message;

  ReviewError(this.message);
}

// Bloc
class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ApiService apiService;

  ReviewBloc(this.apiService) : super(ReviewInitial()) {
    on<FetchReviews>(_onFetchReviews);
    on<AddReview>(_onAddReview);
  }

  Future<void> _onFetchReviews(FetchReviews event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      final reviews = await apiService.fetchReviews(event.listingId);
      emit(ReviewLoaded(reviews));
    } catch (e) {
      emit(ReviewError(e.toString()));
    }
  }

  Future<void> _onAddReview(AddReview event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      await apiService.addReview(event.review);
      final reviews = await apiService.fetchReviews(event.review.listingId);
      emit(ReviewLoaded(reviews));
    } catch (e) {
      emit(ReviewError(e.toString()));
    }
  }
}
