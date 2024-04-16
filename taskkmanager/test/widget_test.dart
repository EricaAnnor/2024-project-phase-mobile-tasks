// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskkmanager/body.dart';
import 'package:taskkmanager/new_task.dart';
import 'package:taskkmanager/splash.dart';
import 'package:taskkmanager/todo.dart';

void main() {
  testWidgets('Splash Screen navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: Splash()));

    expect(find.byKey(const Key('splashBtn')), findsOneWidget);

    //Splash screen navigation
    await tester.tap(find.byKey(const Key('splashBtn')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('tasklists')), findsOneWidget);
  });

  testWidgets('Checking if AddTodo navigations work correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Todo()));

    expect(find.byKey(const Key('_todo')), findsOneWidget);

    await tester.tap(find.byKey(const Key('_todo')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('newTester')), findsOneWidget);
    expect(find.byKey(const Key('nameTest')), findsOneWidget);
    expect(find.byKey(const Key('dateTest')), findsOneWidget);
    expect(find.byKey(const Key('desTest')), findsOneWidget);
    expect(find.byKey(const Key('addtaskbtn')), findsOneWidget);

    // await tester.tap(find.byKey(Key('addtaskbtn')));
    // await tester.pumpAndSettle();

    // expect(find.byKey(const Key('_todo')), findsOneWidget);
  });

  testWidgets('checking if tasks are added sucessfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Todo()));

    // expect(find.byKey(const Key('nameTest')), findsOneWidget);
    // expect(find.byKey(const Key('dateTest')), findsOneWidget);
    // expect(find.byKey(const Key('desTest')), findsOneWidget);
    // expect(find.byKey(const Key('addtaskbtn')), findsOneWidget);

    await tester.tap(find.byKey(Key('_todo')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('nameTest')), 'Erica');
    await tester.enterText(find.byKey(const Key('dateTest')), '22-08-23');
    await tester.enterText(find.byKey(const Key('desTest')), 'This is me');

    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('addtaskbtn')));
    await tester.tap(find.byKey(const Key('addtaskbtn')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('Erica')), findsOneWidget);

    //checking behaviour with empty task names

    await tester.tap(find.byKey(Key('_todo')));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('nameTest')), '');
    await tester.enterText(find.byKey(const Key('dateTest')), '');
    await tester.enterText(find.byKey(const Key('desTest')), '');

    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('addtaskbtn')));
    await tester.tap(find.byKey(const Key('addtaskbtn')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('')), findsNothing);

  });

  testWidgets('checking if tasks are displayed correctly on the todo screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Todo()));

   

    await tester.pump();
    expect(find.byKey(const Key('todoColumn')), findsOneWidget);
    
  });
}
