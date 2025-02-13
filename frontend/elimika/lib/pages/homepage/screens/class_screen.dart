import 'package:flutter/material.dart';

class PersonalizedScreen extends StatelessWidget {
  const PersonalizedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Hub'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Subjects & Topics'),
            _buildSubjectList(),
            SizedBox(height: 20),
            _buildSectionTitle('Adaptive Learning Path'),
            _buildLearningPath(),
            SizedBox(height: 20),
            _buildSectionTitle('Study Resources'),
            _buildStudyResources(),
            SizedBox(height: 20),
            _buildSectionTitle('Practice Quizzes'),
            _buildPracticeQuizzes(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSubjectList() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Subject 1'),
          subtitle: LinearProgressIndicator(value: 0.7),
        ),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Subject 2'),
          subtitle: LinearProgressIndicator(value: 0.5),
        ),
      ],
    );
  }

  Widget _buildLearningPath() {
    return Card(
      child: ListTile(
        title: Text('Suggested Topic: Advanced Algebra'),
        trailing: ElevatedButton(
          onPressed: () {},
          child: Text('Start Learning'),
        ),
      ),
    );
  }

  Widget _buildStudyResources() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.picture_as_pdf),
          title: Text('Resource 1: PDF Guide'),
        ),
        ListTile(
          leading: Icon(Icons.video_library),
          title: Text('Resource 2: Video Lecture'),
        ),
        TextButton(onPressed: () {}, child: Text('View All')),
      ],
    );
  }

  Widget _buildPracticeQuizzes() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.quiz),
          title: Text('Quiz 1: Algebra Basics'),
          trailing: ElevatedButton(
            onPressed: () {},
            child: Text('Take Quiz'),
          ),
        ),
      ],
    );
  }
}
