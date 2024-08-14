import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/listing_bloc.dart';
import '../models/listing.dart';

class EditListingScreen extends StatefulWidget {
  final Listing listing;

  EditListingScreen({required this.listing});

  @override
  _EditListingScreenState createState() => _EditListingScreenState();
}

class _EditListingScreenState extends State<EditListingScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _bedroomsController;
  late TextEditingController _bathroomsController;
  late TextEditingController _areaController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.listing.title);
    _descriptionController = TextEditingController(text: widget.listing.description);
    _priceController = TextEditingController(text: widget.listing.price.toString());
    _bedroomsController = TextEditingController(text: widget.listing.bedrooms.toString());
    _bathroomsController = TextEditingController(text: widget.listing.bathrooms.toString());
    _areaController = TextEditingController(text: widget.listing.area.toString());
    _addressController = TextEditingController(text: widget.listing.address);
    _cityController = TextEditingController(text: widget.listing.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Listing')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 3,
          ),
          TextField(
            controller: _priceController,
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _bedroomsController,
            decoration: InputDecoration(labelText: 'Bedrooms'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _bathroomsController,
            decoration: InputDecoration(labelText: 'Bathrooms'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _areaController,
            decoration: InputDecoration(labelText: 'Area (m²)'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _addressController,
            decoration: InputDecoration(labelText: 'Address'),
          ),
          TextField(
            controller: _cityController,
            decoration: InputDecoration(labelText: 'City'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text('Update Listing'),
            onPressed: () {
              final updatedListing = Listing(
                id: widget.listing.id,
                title: _titleController.text,
                description: _descriptionController.text,
                price: double.parse(_priceController.text),
                bedrooms: int.parse(_bedroomsController.text),
                bathrooms: int.parse(_bathroomsController.text),
                area: double.parse(_areaController.text),
                address: _addressController.text,
                city: _cityController.text,
              );
              BlocProvider.of<ListingBloc>(context).add(UpdateListing(updatedListing));
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
