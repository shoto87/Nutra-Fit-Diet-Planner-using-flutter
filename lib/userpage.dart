import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      backgroundColor: Color(0xFFccffb6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF7ed957),
              ),
              child: Icon(
                Icons.person,
                size: 50.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7ed957),
              ),
              onPressed: () {},
              child: Text('Personal Details'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7ed957),
              ),
              onPressed: () {},
              child: Text('Settings'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7ed957),
              ),
              onPressed: () {},
              child: Text('FAQ'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7ed957),
              ),
              onPressed: () {},
              child: Text('Customer Service'),
            ),
          ],
        ),
      ),
    );
  }
}
