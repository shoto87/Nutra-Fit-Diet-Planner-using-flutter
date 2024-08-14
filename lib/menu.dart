import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'userpage.dart';
import 'switchplans.dart';

class DailyMenuScreen extends StatefulWidget {
  @override
  _DailyMenuScreenState createState() => _DailyMenuScreenState();
}

class _DailyMenuScreenState extends State<DailyMenuScreen> {
  DateTime _selectedDate = DateTime.now();

  // Menu data structure
  Map<String, List<Map<String, String>>> weeklyMenu = {
    'Sunday': [
      {'meal': 'Breakfast', 'description': 'Poha mixed with matki'},
      {'meal': 'Lunch', 'description': 'Healthy mixed greens'},
      {'meal': 'Dinner', 'description': 'Grilled chicken breast'},
    ],
    'Monday': [
      {'meal': 'Breakfast', 'description': 'Overnight oats'},
      {
        'meal': 'Lunch',
        'description': 'Aloo Gobi (Potato & Cauliflower Curry)'
      },
      {
        'meal': 'Dinner',
        'description': 'Chole (Chickpea Curry) + Pickle and Onion Salad'
      },
    ],
    'Tuesday': [
      {
        'meal': 'Breakfast',
        'description': 'Idli with Sambar and Coconut Chutney'
      },
      {'meal': 'Lunch', 'description': 'Mixed Vegetable'},
      {'meal': 'Dinner', 'description': 'Rajma (Kidney Bean Curry)'},
    ],
    'Wednesday': [
      {'meal': 'Breakfast', 'description': 'Poha mixed with matki'},
      {'meal': 'Lunch', 'description': 'Healthy mixed greens'},
      {'meal': 'Dinner', 'description': 'Grilled chicken breast'},
    ],
    'Thursday': [
      {'meal': 'Breakfast', 'description': 'Omelette with veggies'},
      {'meal': 'Lunch', 'description': 'Ham and cheese sandwich'},
      {'meal': 'Dinner', 'description': 'Grilled steak with sides'},
    ],
    'Friday': [
      {'meal': 'Breakfast', 'description': 'Smoothie Bowl with fruits'},
      {'meal': 'Lunch', 'description': 'Chicken Salad'},
      {'meal': 'Dinner', 'description': 'Fish Curry with rice'},
    ],
    'Saturday': [
      {'meal': 'Breakfast', 'description': 'Pancakes with syrup'},
      {'meal': 'Lunch', 'description': 'Healthy mixed greens'},
      {'meal': 'Dinner', 'description': 'Grilled Chicken with veggies'},
    ],
    // Add other days' menus here...
  };

  @override
  Widget build(BuildContext context) {
    String selectedDay = DateFormat('EEEE').format(_selectedDate);
    List<Map<String, String>> menuItems = weeklyMenu[selectedDay] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.person,
                color: Color(0xFF7ed957)), // Profile icon color
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFccffb6), // Background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headline with profile icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'For Today\'s Menu',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.person,
                      color: Color(0xFF7ed957)), // Profile icon color
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
            // Horizontal Scrollable Day Menu
            Container(
              height: 80.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7, // 7 days in a week
                itemBuilder: (context, index) {
                  DateTime date = _selectedDate.subtract(
                      Duration(days: _selectedDate.weekday - 1 - index));
                  String day =
                      DateFormat('EEEE').format(date); // Day of the week
                  String dateString = DateFormat('MM/dd').format(date); // Date

                  bool isSelected = date.day == _selectedDate.day &&
                      date.month == _selectedDate.month &&
                      date.year == _selectedDate.year;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                    child: Container(
                      width: 100.0,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xFF7ed957) : Colors.white,
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
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              day.substring(
                                  0, 3), // Display first 3 letters of the day
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              dateString, // Display date
                              style: TextStyle(
                                fontSize: 14.0,
                                color: isSelected
                                    ? Colors.white70
                                    : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            // Daily Menu
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return _buildMenuItem(menuItems[index]['meal']!,
                      menuItems[index]['description']!);
                },
              ),
            ),
            // Replace Plan Button
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF7ed957), // Button color
                ),
                onPressed: () async {
                  final selectedMealSet = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReplaceMealSetScreen()),
                  );

                  if (selectedMealSet != null) {
                    setState(() {
                      // Update the menu for the selected day
                      weeklyMenu[selectedDay] = [
                        {
                          'meal': 'Breakfast',
                          'description': selectedMealSet['Breakfast'] ?? ''
                        },
                        {
                          'meal': 'Lunch',
                          'description': selectedMealSet['Lunch'] ?? ''
                        },
                        {
                          'meal': 'Dinner',
                          'description': selectedMealSet['Dinner'] ?? ''
                        },
                      ];
                    });
                  }
                },
                child: Text(
                  'Replace Plan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String meal, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF64af6a), // Background color for menu items
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for Image
          Container(
            height: 150.0,
            width: double.infinity,
            color: Colors.grey[300], // Dummy image
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
            meal,
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
    );
  }
}
