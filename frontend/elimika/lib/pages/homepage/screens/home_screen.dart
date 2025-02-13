import 'package:elimika/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      // appBar: AppBar(
      //   title: Text('Student Dashboard'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.account_circle),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPerformanceSummary(),
            SizedBox(height: 16),
            _buildUpcomingAssessments(),
            SizedBox(height: 16),
            _buildRecommendedLessons(),
            SizedBox(height: 16),
            // _buildAIChatAssistant(),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceSummary() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade400),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Performance Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            LinearProgressIndicator(
              color: Color(0xff5f76f6),
              value: 0.7,
              minHeight: 10,
              borderRadius: BorderRadius.circular(4),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Strength Areas: Math, Science'),
                Text('Weak Areas: History, English'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingAssessments() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade400),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upcoming Assessments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Math Test'),
              subtitle: Text('Tomorrow - 10:00 AM'),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Science Quiz'),
              subtitle: Text('Friday - 2:00 PM'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: () {}, child: Text('View All')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedLessons() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade400),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recommended Lessons',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Mathematics activies'),
              subtitle: Text('Mathematics'),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Literacy Activities'),
              subtitle: Text('Science'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: () {}, child: Text('View All')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAIChatAssistant() {
    return Center(
      child: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
        tooltip: 'AI Chat Assistant',
      ),
    );
  }
}
