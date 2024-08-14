import 'package:flutter/material.dart';

class ReplacePlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replace Dish'),
        backgroundColor: Color(0xFF7ed957), // AppBar color
      ),
      backgroundColor: Color(0xFFccffb6), // Background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a Meal to Replace',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: [
                  _buildMealSet(context, 'Breakfast'),
                  _buildMealSet(context, 'Lunch'),
                  _buildMealSet(context, 'Dinner'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealSet(BuildContext context, String meal) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReplaceDishScreen(meal: meal)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFF64af6a), // Background color for meal sets
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Text(
          meal,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Text color
          ),
        ),
      ),
    );
  }
}

class ReplaceDishScreen extends StatelessWidget {
  final String meal;

  ReplaceDishScreen({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replace $meal'),
        backgroundColor: Color(0xFF7ed957), // AppBar color
      ),
      backgroundColor: Color(0xFFccffb6), // Background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a Dish for $meal',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            // Placeholder for the list of dishes to choose from
            Expanded(
              child: ListView(
                children: [
                  _buildDishOption('Dish 1', 'Description for Dish 1'),
                  _buildDishOption('Dish 2', 'Description for Dish 2'),
                  _buildDishOption('Dish 3', 'Description for Dish 3'),
                  // Add more dishes as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDishOption(String dishName, String description) {
    return GestureDetector(
      onTap: () {
        // Handle dish replacement logic here
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFF64af6a), // Background color for dish options
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dishName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white70, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
