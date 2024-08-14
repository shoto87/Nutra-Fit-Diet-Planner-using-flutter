import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
        ),
        body: ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Picture
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/profile_picture.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          // Register Button
          ElevatedButton(
            onPressed: () {
              // Handle Register button press
            },
            child: Text('Register'),
          ),
          SizedBox(height: 10.0),
          // Sign In Button
          ElevatedButton(
            onPressed: () {
              // Handle Sign In button press
            },
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
