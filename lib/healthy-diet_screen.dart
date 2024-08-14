import 'package:flutter/material.dart';
import 'userpage.dart';
import 'form.dart';

class HealthyDietScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy Diet Plan'),
      ),
      backgroundColor: Color(0xFFccffb6),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Healthy Diet for You',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Color(0xFF7ed957)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Click below and we will find the best plan based on your need',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF7ed957),
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DietFormScreen()),
                );
              },
              child: Text(
                'Enter Details >',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
            // SizedBox(height: 40.0),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Features',
            //     style: TextStyle(
            //       fontSize: 20.0,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 20.0),
            // Container(
            //   height: 100.0,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       MenuItem(
            //           title: 'Plan 1',
            //           onTap: () => _onMenuItemTap(context, 'Plan 1')),
            //       MenuItem(
            //           title: 'Plan 2',
            //           onTap: () => _onMenuItemTap(context, 'Plan 2')),
            //       MenuItem(
            //           title: 'Plan 3',
            //           onTap: () => _onMenuItemTap(context, 'Plan 3')),
            //       MenuItem(
            //           title: 'Plan 4',
            //           onTap: () => _onMenuItemTap(context, 'Plan 4')),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _onMenuItemTap(BuildContext context, String plan) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('You tapped on $plan'),
    ));
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  MenuItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150.0,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Color(0xFF7ed957),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
