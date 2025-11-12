import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  String timeUntilExam() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    if (diff.isNegative) return "Испитот е завршен.";
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Датум: ${DateFormat('dd MMM yyyy').format(exam.dateTime)}',
              style: const TextStyle(fontSize: 18)),
          Text('Време: ${DateFormat('HH:mm').format(exam.dateTime)}',
              style: const TextStyle(fontSize: 18)),
          Text('Просторија: ${exam.rooms.join(', ')}',
              style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          Text(timeUntilExam(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
