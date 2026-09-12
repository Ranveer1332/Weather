import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weather_flutter/main.dart';

void main() {
  testWidgets('WeatherScreen renders app bar title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify the app bar title is displayed.
    expect(find.text('Weather App'), findsOneWidget);

    // Verify the refresh button exists.
    expect(find.byIcon(Icons.refresh), findsOneWidget);

    // Verify a loading indicator appears while fetching data.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
