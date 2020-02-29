import 'package:flutter_test/flutter_test.dart';
import 'package:krappr/src/ui/screen/home_screen.dart';
import 'package:krappr/src/ui/screen/login_screen.dart';
import 'package:krappr/src/ui/widget/map_widget.dart';

import 'build_testable_widget.dart';

void main() {
  testWidgets("Home Screen Can Be Created", (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(HomeScreen()));
  });

  testWidgets("Map Widget Can Be Created", (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(MapWidget()));
  });

  testWidgets("Login Screen Can Be Created", (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginScreen()));
  });
}