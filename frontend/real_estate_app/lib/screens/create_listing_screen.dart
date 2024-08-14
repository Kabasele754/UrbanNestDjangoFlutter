import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/listing_bloc.dart';
import '../models/listing.dart';

class CreateListingScreen extends StatefulWidget {
  @override
  _CreateListingScreenState createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends State<CreateListingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _bedroomsController = TextEditingController();
  final _bathroomsController = TextEditingController();
  final _areaController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Listing')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a price';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _bedroomsController,
              decoration: InputDecoration(labelText: 'Bedrooms'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _bathroomsController,
              decoration: InputDecoration(labelText: 'Bathrooms'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _areaController,
              decoration: InputDecoration(labelText: 'Area (m²)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Create Listing'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final listing = Listing(
                    id: '', // ID will be assigned by the server
                    title: _titleController.text,
                    description: _descriptionController.text,
                    price: double.parse(_priceController.text),
                    bedrooms: int.parse(_bedroomsController.text),
                    bathrooms: int.parse(_bathroomsController.text),
                    area: double.parse(_areaController.text),
                    address: _addressController.text,
                    city: _cityController.text,
                  );
                  BlocProvider.of<ListingBloc>(context).add(CreateListing(listing));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
