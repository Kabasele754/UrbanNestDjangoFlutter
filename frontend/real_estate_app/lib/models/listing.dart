class Listing {
  final String id;
  final String title;
  final String description;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final double area;
  final String address;
  final String city;
  final String imageUrl;

  Listing({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.address,
    required this.city,
    this.imageUrl = 'https://via.placeholder.com/300x200',
  });

  factory Listing.fromJson(Map json) {
    return Listing(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      area: json['area'].toDouble(),
      address: json['address'],
      city: json['city'],
      imageUrl: json['image_url'] ?? 'https://via.placeholder.com/300x200',
    );
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'address': address,
      'city': city,
      'image_url': imageUrl,
    };
  }
}