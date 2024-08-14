import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60, // Adjust radius as needed
                backgroundImage: AssetImage('assets/images/2.png'),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'John Doe',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'john.doe@example.com',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading:
                        Icon(Icons.edit, color: Theme.of(context).primaryColor),
                    title: Text('Edit Profile'),
                    onTap: () {
                      // Navigate to edit profile screen
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.list, color: Theme.of(context).primaryColor),
                    title: Text('My Listings'),
                    onTap: () {
                      // Navigate to my listings screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings,
                        color: Theme.of(context).primaryColor),
                    title: Text('Settings'),
                    onTap: () {
                      // Navigate to settings screen
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app,
                        color: Theme.of(context).primaryColor),
                    title: Text('Logout'),
                    onTap: () {
                      // Implement logout logic
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
