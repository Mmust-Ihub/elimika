import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Settings state
  double _difficultyLevel = 2.0;
  String _selectedContentStyle = 'Visual';
  bool _assessmentNotifications = true;
  bool _studyPlanReminders = true;

  final List<String> _contentStyles = [
    'Visual',
    'Text-based',
    'Interactive',
    'Audio',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: const Icon(Icons.person, color: Colors.blue),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Learning Preferences Section
          _buildSectionHeader('Learning Preferences'),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Difficulty Level',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Slider(
                    value: _difficultyLevel,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    label: _getDifficultyLabel(_difficultyLevel),
                    onChanged: (value) {
                      setState(() {
                        _difficultyLevel = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Content Style',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedContentStyle,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    items: _contentStyles.map((style) {
                      return DropdownMenuItem(
                        value: style,
                        child: Text(style),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedContentStyle = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Notification Settings Section
          _buildSectionHeader('Notification Settings'),
          Card(
            elevation: 2,
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Assessment Notifications'),
                  subtitle: const Text(
                    'Receive notifications about upcoming assessments',
                  ),
                  value: _assessmentNotifications,
                  onChanged: (value) {
                    setState(() {
                      _assessmentNotifications = value;
                    });
                  },
                ),
                const Divider(),
                SwitchListTile(
                  title: const Text('Study Plan Reminders'),
                  subtitle: const Text(
                    'Get daily reminders about your study schedule',
                  ),
                  value: _studyPlanReminders,
                  onChanged: (value) {
                    setState(() {
                      _studyPlanReminders = value;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Progress History Section
          _buildSectionHeader('Progress History'),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.history),
              title: const Text('View Progress History'),
              subtitle: const Text('Track your learning journey'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to progress history screen
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProgressHistoryScreen()));
              },
            ),
          ),

          const SizedBox(height: 24),

          // Save Button
          ElevatedButton(
            onPressed: () {
              // Save settings logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings saved successfully')),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
            ),
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  String _getDifficultyLabel(double value) {
    switch (value.round()) {
      case 1:
        return 'Beginner';
      case 2:
        return 'Easy';
      case 3:
        return 'Intermediate';
      case 4:
        return 'Advanced';
      case 5:
        return 'Expert';
      default:
        return 'Intermediate';
    }
  }
}

// Add this to your theme data
ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  cardTheme: const CardTheme(
    margin: EdgeInsets.zero,
  ),
  sliderTheme: const SliderThemeData(
    showValueIndicator: ShowValueIndicator.always,
  ),
);
