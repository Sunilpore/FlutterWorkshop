import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ws_trail/test_samples/ui_test/ui_test.dart';


void main() {


  testWidgets('MyWidget has a title and message', (tester) async {

    await tester.pumpWidget(const UITestWidget(title: 'T', message: 'M'));
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });


  /// 1. Find a Text widget
  testWidgets('finds a Text widget', (tester) async {
// Build an App with a Text widget that displays the letter 'H'.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('H'),
      ),
    ));

// Find a widget that displays the letter 'H'.
    expect(find.text('H'), findsOneWidget);
  });


  /// 2. Find a widget with a specific Key
  testWidgets('finds a widget using a Key', (tester) async {
    // Define the test key.
    const testKey = Key('M');

    // Build a MaterialApp with the testKey.
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(Key('M')), findsOneWidget);
  });


  /// 3. Find a specific widget instance
  testWidgets('finds a specific instance', (tester) async {

    const childWidget = Padding(padding: EdgeInsets.zero);

    const childWidgetTwo = Padding(padding: EdgeInsets.zero);

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidgetTwo), findsOneWidget);
  });


}