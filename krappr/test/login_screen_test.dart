import 'package:flutter_test/flutter_test.dart';
import 'package:krappr/src/ui/login_screen.dart';

import 'build_testable_widget.dart';

void main() {
  // TODO: Issue no. 5 - Constants should not be hardcoded
  testWidgets("Login Title and Button is Called Login", (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginScreen()));

    final titleFinder = find.text("Login");
    
    expect(titleFinder, findsNWidgets(2));
  });

  testWidgets("Email Address Input Field Exists", (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginScreen()));

    final inputFinder = find.text("Email Address");

    expect(inputFinder, findsOneWidget);
  });

  testWidgets("Email Input Widget has Example Input Text", (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginScreen()));

    final inputFinder = find.text("you@example.com");

    expect(inputFinder, findsOneWidget);
  });

  testWidgets("Password Input Field Exists", (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginScreen()));

    final inputFinder = find.text("Password");

    expect(inputFinder, findsOneWidget);
  });
  
  testWidgets("Password Input has example input text", (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginScreen()));

    final inputFinder = find.text("Super Secret");

    expect(inputFinder, findsOneWidget);
  });
}