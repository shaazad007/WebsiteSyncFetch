import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:website_sync_fetch/controllers/seo_controller.dart';
import 'package:website_sync_fetch/services/seo_fetch_service.dart';

void main() {
  group('SeoController Tests', () {
    late SeoController controller;

    setUp(() {
      final mockClient = MockClient((request) async {
        final url = request.url.toString();
        if (url.contains('site1.com')) {
          return http.Response(
            '<html><head><title>Site 1 Title</title></head></html>',
            200,
          );
        } else if (url.contains('site2.com')) {
          return http.Response(
            '<html><head><title>Site 2 Title</title></head></html>',
            200,
          );
        }
        return http.Response('Not Found', 404);
      });

      final service = SeoFetchService(client: mockClient);
      controller = SeoController(service: service);
    });

    test('syncUrl sets error for empty input', () async {
      await controller.syncUrl('');
      expect(controller.errorMessage, isNotNull);
      expect(controller.results, isEmpty);
    });

    test('syncUrl appends new rows for multiple websites', () async {
      await controller.syncUrl('site1.com');
      expect(controller.results.length, 1);
      expect(controller.results.first.pageTitle, 'Site 1 Title');

      await controller.syncUrl('site2.com');
      expect(controller.results.length, 2);
      expect(controller.results[1].pageTitle, 'Site 2 Title');
    });

    test('deleteRow removes specific row without deleting others', () async {
      await controller.syncUrl('site1.com');
      await controller.syncUrl('site2.com');
      expect(controller.results.length, 2);

      final firstRowId = controller.results.first.id;
      controller.deleteRow(firstRowId);

      expect(controller.results.length, 1);
      expect(controller.results.first.pageTitle, 'Site 2 Title');
    });

    test('handleOk clears text controller and resets error message', () {
      final textEditingController = TextEditingController(
        text: 'https://test.com',
      );
      controller.handleOk(textEditingController);

      expect(textEditingController.text, isEmpty);
      expect(controller.errorMessage, isNull);
    });
  });
}
