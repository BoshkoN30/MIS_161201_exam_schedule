import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    return Card(
      color: isPast ? Colors.grey[300] : Colors.lightBlue[50],
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: const Icon(Icons.school, size: 30),
        title: Text(
          exam.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 4),
              Text(DateFormat('dd MMM yyyy').format(exam.dateTime)),
            ]),
            Row(children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 4),
              Text(DateFormat('HH:mm').format(exam.dateTime)),
            ]),
            Row(children: [
              const Icon(Icons.room, size: 16),
              const SizedBox(width: 4),
              Text(exam.rooms.join(', ')),
            ]),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
          );
        },
      ),
    );
  }
}