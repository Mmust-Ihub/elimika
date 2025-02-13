import 'package:elimika/state/chat/chatProvider.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssessmentReport {
  final String subject;
  final String date;
  final String grade;
  final List<double> progressData;

  AssessmentReport({
    required this.subject,
    required this.date,
    required this.grade,
    required this.progressData,
  });
}

class TeacherFeedback {
  final String subject;
  final String date;
  final String teacherName;
  final String comment;

  TeacherFeedback({
    required this.subject,
    required this.date,
    required this.teacherName,
    required this.comment,
  });
}

class AssessmentsScreen extends ConsumerStatefulWidget {
  AssessmentsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AssessmentsScreen> createState() => _AssessmentsScreenState();
}

class _AssessmentsScreenState extends ConsumerState<AssessmentsScreen> {
  final List<AssessmentReport> reports = [
    AssessmentReport(
      subject: 'Mathematics',
      date: '2025-02-10',
      grade: 'A',
      progressData: [85, 88, 92, 90, 94],
    ),
    AssessmentReport(
      subject: 'Science',
      date: '2025-02-08',
      grade: 'B+',
      progressData: [78, 82, 85, 88, 86],
    ),
    AssessmentReport(
      subject: 'Social Studies',
      date: '2025-02-08',
      grade: 'C+',
      progressData: [48, 58, 55, 52, 50],
    ),
  ];

  final List<TeacherFeedback> feedback = [
    TeacherFeedback(
      subject: 'Mathematics',
      date: '2025-02-10',
      teacherName: 'Dr. Smith',
      comment: 'Excellent progress in calculus. Keep up the good work!',
    ),
    TeacherFeedback(
      subject: 'Physics',
      date: '2025-02-08',
      teacherName: 'Prof. Johnson',
      comment:
          'Good understanding of mechanics, focus more on problem-solving.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessments & Reports 📊'),
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            'Competency-Based Reports',
            _buildCompetencyReports(context),
          ),
          const SizedBox(height: 24),
          _buildSection(
            'Grade Predictions',
            _buildGradePredictions(),
          ),
          const SizedBox(height: 24),
          _buildSection(
            'Teacher Feedback',
            _buildTeacherFeedback(),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content,
        ],
      ),
    );
  }

  Widget _buildCompetencyReports(BuildContext context) {
    final reportState = ref.watch(reportProvider);
    return Column(
      children: [
        // ...reports.map((report) => _buildReportItem(report)),
        Padding(
          padding: const EdgeInsets.all(16),
          child: reportState.isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    print(reportState.isLoading);

                    await ref.read(reportProvider.notifier).report();
                    _showAllReportsBottomSheet(context);
                  },
                  child: const Text(
                    'View Pathway Report',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  void _showAllReportsBottomSheet(BuildContext context) {
    final reportState = ref.watch(reportProvider);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Makes the bottom sheet larger
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8, // Takes up 70% of screen
        minChildSize: 0.5, // Minimum 50% of screen
        maxChildSize: 0.9, // Maximum 95% of screen
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              SizedBox(height: 16),
              const Text(
                'Pathway Reports',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(reportState.response != null
                    ? reportState.response!
                    : reportState.errorMessage!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportItem(AssessmentReport report) {
    return ListTile(
      title: Text(report.subject),
      subtitle: Text('Date: ${report.date}'),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          report.grade,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      onTap: () {
        // Navigate to detailed report
      },
    );
  }

  Widget _buildGradePredictions() {
    return Column(
      children: reports.map((report) => _buildPredictionCard(report)).toList(),
    );
  }

  Widget _buildPredictionCard(AssessmentReport report) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            report.subject,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: false,
                  // bottomTitles: SideTitles(showTitles: false),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: report.progressData.asMap().entries.map((e) {
                      return FlSpot(e.key.toDouble(), e.value);
                    }).toList(),
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Predicted Grade: ${report.grade}'),
              Text('Confidence: High'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherFeedback() {
    return Column(
      children: [
        ...feedback.map((item) => _buildFeedbackItem(item)),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              // Navigate to all feedback
            },
            child: const Text('View All Feedback'),
          ),
        ),
      ],
    );
  }

  Widget _buildFeedbackItem(TeacherFeedback feedback) {
    return ListTile(
      title: Text(feedback.subject),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${feedback.teacherName} - ${feedback.date}'),
          const SizedBox(height: 4),
          Text(
            feedback.comment,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
      isThreeLine: true,
    );
  }
}
