class Review {
  final String id;
  final String listingId;
  final String userId;
  final String username;
  final String content;
  final int rating;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.listingId,
    required this.userId,
    required this.username,
    required this.content,
    required this.rating,
    required this.createdAt,
  });

  factory Review.fromJson(Map json) {
    return Review(
      id: json['id'],
      listingId: json['listing_id'],
      userId: json['user_id'],
      username: json['username'],
      content: json['content'],
      rating: json['rating'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'listing_id': listingId,
      'user_id': userId,
      'username': username,
      'content': content,
      'rating': rating,
      'created_at': createdAt.toIso8601String(),
    };
  }
}