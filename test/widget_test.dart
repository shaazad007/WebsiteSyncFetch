import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:website_sync_fetch/controllers/seo_controller.dart';
import 'package:website_sync_fetch/services/seo_fetch_service.dart';
import 'package:website_sync_fetch/ui/main_screen.dart';

void main() {
  group('MainScreen Widget Tests', () {
    late SeoController controller;

    setUp(() {
      final mockClient = MockClient((request) async {
        final url = request.url.toString();
        if (url.contains('example.com')) {
          return http.Response(
            '<html><head><title>Example Domain</title></head><body><h1>Heading 1</h1></body></html>',
            200,
          );
        }
        return http.Response('Error', 500);
      });

      controller = SeoController(service: SeoFetchService(client: mockClient));
    });

    testWidgets('renders key UI elements on initial load', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: MainScreen(controller: controller)),
      );

      expect(find.text('Website Sync Fetch'), findsOneWidget);
      expect(find.byKey(const Key('url_input_field')), findsOneWidget);
      expect(find.byKey(const Key('sync_button')), findsOneWidget);
      expect(find.byKey(const Key('ok_button')), findsOneWidget);
      expect(find.byKey(const Key('close_app_button')), findsOneWidget);
      expect(find.text('No SEO results yet'), findsOneWidget);
    });

    testWidgets('entering URL and clicking Sync adds row to table', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: MainScreen(controller: controller)),
      );

      await tester.enterText(
        find.byKey(const Key('url_input_field')),
        'https://example.com',
      );
      await tester.tap(find.byKey(const Key('sync_button')));
      await tester.pumpAndSettle();

      expect(find.text('Example Domain'), findsOneWidget);
      expect(find.text('Heading 1'), findsOneWidget);
      expect(find.text('Success'), findsOneWidget);
    });

    testWidgets('tapping Delete row button removes specific row', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: MainScreen(controller: controller)),
      );

      // Add row
      await tester.enterText(
        find.byKey(const Key('url_input_field')),
        'https://example.com',
      );
      await tester.tap(find.byKey(const Key('sync_button')));
      await tester.pumpAndSettle();

      expect(find.text('Example Domain'), findsOneWidget);

      // Delete row using controller directly or scrolling into view
      expect(controller.results.length, 1);
      final rowId = controller.results.first.id;
      final deleteButton = find.byKey(Key('delete_button_$rowId'));

      await tester.ensureVisible(deleteButton);
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();

      expect(find.text('Example Domain'), findsNothing);
      expect(find.text('No SEO results yet'), findsOneWidget);
    });

    testWidgets(
      'OK button clears URL field without deleting existing results',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(home: MainScreen(controller: controller)),
        );

        // Add row
        await tester.enterText(
          find.byKey(const Key('url_input_field')),
          'https://example.com',
        );
        await tester.tap(find.byKey(const Key('sync_button')));
        await tester.pumpAndSettle();

        // Ensure text is in field
        await tester.enterText(
          find.byKey(const Key('url_input_field')),
          'https://new-url.com',
        );
        await tester.pump();

        // Tap OK button
        await tester.tap(find.byKey(const Key('ok_button')));
        await tester.pumpAndSettle();

        // TextField should be empty
        final textField = tester.widget<TextField>(
          find.byKey(const Key('url_input_field')),
        );
        expect(textField.controller?.text, isEmpty);

        // Existing result row remains
        expect(find.text('Example Domain'), findsOneWidget);
      },
    );
  });
}
