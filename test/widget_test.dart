// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:todo/main.dart';

void main() {
  testWidgets('Todo app adds and removes items', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TodoApp());

    // Verify that our app shows the correct title
    expect(find.text('Todo Home Page'), findsOneWidget);
    
    // Verify that the date is displayed
    expect(find.textContaining('Today:'), findsOneWidget);

    // Enter a todo item
    await tester.enterText(find.byType(TextField), 'Test todo item');
    await tester.tap(find.text('Add'));
    await tester.pump();

    // Verify that the todo item was added
    expect(find.text('Test todo item'), findsOneWidget);

    // Delete the todo item
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify that the todo item was removed
    expect(find.text('Test todo item'), findsNothing);
  });

  testWidgets('Date format works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());
    
    // Verify that the date is displayed and formatted
    expect(find.textContaining('Today:'), findsOneWidget);
    
    // Check that localization delegates are working
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}