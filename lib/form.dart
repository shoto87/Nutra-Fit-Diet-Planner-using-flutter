import 'package:flutter/material.dart';
import 'menu.dart';

class DietFormScreen extends StatefulWidget {
  @override
  _DietFormScreenState createState() => _DietFormScreenState();
}

class _DietFormScreenState extends State<DietFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String? _gender;
  String? _objective;
  String? _workCategory;

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _objectives = [
    'Weight Loss',
    'Muscle Gain',
    'Maintain Weight'
  ];
  final List<String> _workCategories = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Plan Form'),
      ),
      backgroundColor: Color(0xFFccffb6),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headline
            Text(
              'Details',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            // Form
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Age Field
                      TextFormField(
                        controller: _ageController,
                        decoration: InputDecoration(
                          labelText: 'Age',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),

                      // Weight Field
                      TextFormField(
                        controller: _weightController,
                        decoration: InputDecoration(
                          labelText: 'Weight (kg)',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your weight';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),

                      // Height Field
                      TextFormField(
                        controller: _heightController,
                        decoration: InputDecoration(
                          labelText: 'Height (cm)',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your height';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),

                      // Gender Dropdown
                      DropdownButtonFormField<String>(
                        value: _gender,
                        decoration: InputDecoration(
                          labelText: 'Gender',
                        ),
                        items: _genders.map((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),

                      // Objective Dropdown
                      DropdownButtonFormField<String>(
                        value: _objective,
                        decoration: InputDecoration(
                          labelText: 'Objective of Diet',
                        ),
                        items: _objectives.map((objective) {
                          return DropdownMenuItem<String>(
                            value: objective,
                            child: Text(objective),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _objective = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select your diet objective';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),

                      // Work Category Dropdown
                      DropdownButtonFormField<String>(
                        value: _workCategory,
                        decoration: InputDecoration(
                          labelText: 'Category of Work',
                        ),
                        items: _workCategories.map((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _workCategory = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select your work category';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 32.0),

                      // Submit Button
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF7ed957),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 15.0),
                          ),

                          // MAIN ON PRESS FUNCTION IS THIS !

                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('showing the plans')),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DailyMenuScreen()),
                              );
                            }
                          },

                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DietFormScreen(),
  ));
}
