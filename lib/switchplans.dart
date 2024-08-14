import 'package:flutter/material.dart';

class ReplaceMealSetScreen extends StatelessWidget {
  final List<Map<String, String>> mealSets = [
    {
      'Breakfast': 'Poha mixed with matki',
      'Lunch': 'Healthy mixed greens',
      'Dinner': 'Grilled chicken breast',
    },
    {
      'Breakfast': 'Overnight oats',
      'Lunch': 'Aloo Gobi (Potato & Cauliflower Curry)',
      'Dinner': 'Chole (Chickpea Curry) + Pickle and Onion Salad',
    },
    {
      'Breakfast': 'Idli with Sambar and Coconut Chutney',
      'Lunch': 'Mixed Vegetable',
      'Dinner': 'Rajma (Kidney Bean Curry)',
    },
    // Add more sets as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Replace Meal Set'),
        backgroundColor: Color(0xFF64af6a),
      ),
      backgroundColor: Color(0xFFccffb6),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: mealSets.length,
        itemBuilder: (context, index) {
          final mealSet = mealSets[index];
          return GestureDetector(
            onTap: () {
              // Pass the selected meal set back to the previous screen
              Navigator.pop(context, mealSet);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF64af6a),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meal Set ${index + 1}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Breakfast: ${mealSet['Breakfast']}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Lunch: ${mealSet['Lunch']}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Dinner: ${mealSet['Dinner']}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
