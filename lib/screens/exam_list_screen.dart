import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exams = [
      Exam(name: 'Дискретна математика', dateTime: DateTime(2025, 11, 10, 10, 0), rooms: ['101', '102']),
      Exam(name: 'Оперативни системи', dateTime: DateTime(2025, 11, 15, 14, 30), rooms: ['201']),
      Exam(name: 'Компјутерски мрежи', dateTime: DateTime(2025, 11, 5, 9, 0), rooms: ['103']),
      Exam(name: 'Мобилни информациски системи', dateTime: DateTime(2025, 11, 20, 12, 0), rooms: ['104']),
      Exam(name: 'Управување со техничка поддршка', dateTime: DateTime(2025, 12, 1, 15, 0), rooms: ['105']),
      Exam(name: 'Економија на ИКТ инженери', dateTime: DateTime(2025, 12, 5, 11, 30), rooms: ['106']),
      Exam(name: 'Виртуелна реалност', dateTime: DateTime(2025, 10, 28, 13, 0), rooms: ['107']),
      Exam(name: 'Бази на податоци', dateTime: DateTime(2025, 12, 10, 16, 0), rooms: ['108']),
      Exam(name: 'Веб програмирање', dateTime: DateTime(2025, 12, 15, 10, 0), rooms: ['109']),
      Exam(name: 'Калкулус', dateTime: DateTime(2025, 12, 20, 9, 0), rooms: ['110']),
    ];

    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 161201'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) => ExamCard(exam: exams[index]),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.indigo,
        child: Text(
          'Вкупно испити: ${exams.length}',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
