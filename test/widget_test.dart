// Basic Flutter widget test for the exam schedule app.
//
// This test verifies that the home screen loads correctly and shows the AppBar title.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exam_schedule/main.dart';

void main() {
  testWidgets('Exam schedule home screen loads', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const ExamApp());

    // Verify that the AppBar title is displayed.
    expect(find.text('Распоред за испити - 161201'), findsOneWidget);

    // Verify that at least one exam card is displayed.
    expect(find.byType(Card), findsWidgets);

    // Optionally, check that tapping a card navigates to the detail screen.
    await tester.tap(find.byType(Card).first);
    await tester.pumpAndSettle();

    // The detail screen should display the exam name.
    expect(find.textContaining('Датум:'), findsOneWidget);
  });
}
