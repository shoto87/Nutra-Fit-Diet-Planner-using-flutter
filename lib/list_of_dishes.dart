import 'package:flutter/material.dart';

class DishGridScreen extends StatelessWidget {
  final List<Map<String, String>> dishes = [
    {'name': 'Dish 1', 'protein': '20g', 'carbs': '30g', 'fats': '10g'},
    {'name': 'Dish 2', 'protein': '18g', 'carbs': '25g', 'fats': '12g'},
    {'name': 'Dish 3', 'protein': '22g', 'carbs': '28g', 'fats': '8g'},
    {'name': 'Dish 4', 'protein': '15g', 'carbs': '35g', 'fats': '10g'},
    {'name': 'Dish 5', 'protein': '24g', 'carbs': '20g', 'fats': '14g'},
    {'name': 'Dish 6', 'protein': '19g', 'carbs': '27g', 'fats': '9g'},
    {'name': 'Dish 7', 'protein': '21g', 'carbs': '30g', 'fats': '11g'},
    {'name': 'Dish 8', 'protein': '23g', 'carbs': '24g', 'fats': '10g'},
    {'name': 'Dish 9', 'protein': '20g', 'carbs': '32g', 'fats': '13g'},
    {'name': 'Dish 10', 'protein': '25g', 'carbs': '22g', 'fats': '15g'},
    {'name': 'Dish 11', 'protein': '25g', 'carbs': '22g', 'fats': '15g'},
    {'name': 'Dish 12', 'protein': '25g', 'carbs': '22g', 'fats': '15g'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dish Grid'),
      ),
      backgroundColor: Color(0xFFccffb6),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 2 columns
            crossAxisSpacing: 16.0, // Spacing between columns
            mainAxisSpacing: 16.0, // Spacing between rows
            childAspectRatio: 3 / 4, // Adjust aspect ratio as needed
          ),
          itemCount: dishes.length,
          itemBuilder: (context, index) {
            return _buildDishItem(dishes[index]);
          },
        ),
      ),
    );
  }

  Widget _buildDishItem(Map<String, String> dish) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF64af6a), // Background color for dish items
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for Dish Image
          Container(
            height: 100.0, // Adjust the height according to your needs
            width: double.infinity,
            color:
                Colors.grey[300], // Dummy color or replace with an actual image
            child: Center(
              child: Text(
                'Image here',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            dish['name']!,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Protein: ${dish['protein']}',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70, // Text color
            ),
          ),
          Text(
            'Carbs: ${dish['carbs']}',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70, // Text color
            ),
          ),
          Text(
            'Fats: ${dish['fats']}',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white70, // Text color
            ),
          ),
        ],
      ),
    );
  }
}
