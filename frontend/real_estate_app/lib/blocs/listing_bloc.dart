import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import '../models/listing.dart';

// Events
abstract class ListingEvent {}

class FetchListings extends ListingEvent {}

class CreateListing extends ListingEvent {
  final Listing listing;

  CreateListing(this.listing);
}

class UpdateListing extends ListingEvent {
  final Listing listing;

  UpdateListing(this.listing);
}

class DeleteListing extends ListingEvent {
  final String listingId;

  DeleteListing(this.listingId);
}

// States
abstract class ListingState {}

class ListingInitial extends ListingState {}

class ListingLoading extends ListingState {}

class ListingLoaded extends ListingState {
  final List<Listing> listings;

  ListingLoaded(this.listings);
}

class ListingError extends ListingState {
  final String message;

  ListingError(this.message);
}

// Bloc
class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final ApiService apiService;

  ListingBloc(this.apiService) : super(ListingInitial()) {
    on<FetchListings>(_onFetchListings);
    on<CreateListing>(_onCreateListing);
    on<UpdateListing>(_onUpdateListing);
    on<DeleteListing>(_onDeleteListing);
  }

  Future<void> _onFetchListings(FetchListings event, Emitter<ListingState> emit) async {
    emit(ListingLoading());
    try {
      final listings = await apiService.fetchListings();
      emit(ListingLoaded(listings));
    } catch (e) {
      emit(ListingError(e.toString()));
    }
  }

  Future<void> _onCreateListing(CreateListing event, Emitter<ListingState> emit) async {
    emit(ListingLoading());
    try {
      await apiService.createListing(event.listing);
      final listings = await apiService.fetchListings();
      emit(ListingLoaded(listings));
    } catch (e) {
      emit(ListingError(e.toString()));
    }
  }

  Future<void> _onUpdateListing(UpdateListing event, Emitter<ListingState> emit) async {
    emit(ListingLoading());
    try {
      await apiService.updateListing(event.listing);
      final listings = await apiService.fetchListings();
      emit(ListingLoaded(listings));
    } catch (e) {
      emit(ListingError(e.toString()));
    }
  }

  Future<void> _onDeleteListing(DeleteListing event, Emitter<ListingState> emit) async {
    emit(ListingLoading());
    try {
      await apiService.deleteListing(event.listingId);
      final listings = await apiService.fetchListings();
      emit(ListingLoaded(listings));
    } catch (e) {
      emit(ListingError(e.toString()));
    }
  }
}
