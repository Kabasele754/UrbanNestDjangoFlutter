import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/listing.dart';
import '../models/review.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8001/api';
  String? _token;

  Future<User> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/login/'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _token = data['token'];
      return User.fromJson(data['user']);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<User> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users/register/'),
      body: {'username': username, 'email': email, 'password': password},
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      _token = data['token'];
      return User.fromJson(data['user']);
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<void> logout() async {
    _token = null;
  }

  Future<List<Listing>> fetchListings() async {
    final response = await http.get(Uri.parse('$baseUrl/listings/'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Listing.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch listings');
    }
  }

  Future<void> createListing(Listing listing) async {
    final response = await http.post(
      Uri.parse('$baseUrl/listings/'),
      headers: {'Authorization': 'Token $_token'},
      body: json.encode(listing.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create listing');
    }
  }

  Future<void> updateListing(Listing listing) async {
    final response = await http.put(
      Uri.parse('$baseUrl/listings/${listing.id}/'),
      headers: {'Authorization': 'Token $_token'},
      body: json.encode(listing.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update listing');
    }
  }

  Future<void> deleteListing(String listingId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/listings/$listingId/'),
      headers: {'Authorization': 'Token $_token'},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete listing');
    }
  }

  Future<List<Review>> fetchReviews(String listingId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/listings/$listingId/reviews/'));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch reviews');
    }
  }

  Future<void> addReview(Review review) async {
    final response = await http.post(
      Uri.parse('$baseUrl/listings/${review.listingId}/reviews/'),
      headers: {'Authorization': 'Token $_token'},
      body: json.encode(review.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add review');
    }
  }
}
