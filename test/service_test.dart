import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:website_sync_fetch/services/seo_fetch_service.dart';

void main() {
  group('SeoFetchService - URL Normalization', () {
    late SeoFetchService service;

    setUp(() {
      service = SeoFetchService();
    });

    test('validates and prepends https to domain without scheme', () {
      expect(service.normalizeUrl('example.com'), 'https://example.com');
    });

    test('preserves http and https schemes', () {
      expect(service.normalizeUrl('http://example.com'), 'http://example.com');
      expect(
        service.normalizeUrl('https://example.com/page'),
        'https://example.com/page',
      );
    });

    test('returns null for empty or invalid input', () {
      expect(service.normalizeUrl(''), isNull);
      expect(service.normalizeUrl('   '), isNull);
      expect(service.normalizeUrl('not a url :::'), isNull);
    });
  });

  group('SeoFetchService - HTML Parsing', () {
    late SeoFetchService service;

    setUp(() {
      service = SeoFetchService();
    });

    test('extracts all available SEO fields correctly', () {
      const html = '''
        <!DOCTYPE html>
        <html>
        <head>
          <title>Test Title</title>
          <meta name="description" content="Test Description" />
          <link rel="canonical" href="https://example.com/canonical" />
          <meta name="robots" content="index, follow" />
        </head>
        <body>
          <h1>First Main Heading</h1>
          <h1>Second Heading</h1>
        </body>
        </html>
      ''';

      final result = service.parseHtml(
        id: '1',
        url: 'https://example.com',
        statusCode: 200,
        reasonPhrase: 'OK',
        htmlContent: html,
      );

      expect(result.pageTitle, 'Test Title');
      expect(result.metaDescription, 'Test Description');
      expect(result.canonicalUrl, 'https://example.com/canonical');
      expect(result.metaRobots, 'index, follow');
      expect(result.firstH1, 'First Main Heading');
      expect(result.h1Count, '2');
      expect(result.httpStatus, '200 OK');
      expect(result.fetchStatus, 'Success');
    });

    test('returns "Missing" for missing HTML elements', () {
      const html = '<html><body><p>No SEO info here</p></body></html>';

      final result = service.parseHtml(
        id: '2',
        url: 'https://example.com',
        statusCode: 200,
        reasonPhrase: 'OK',
        htmlContent: html,
      );

      expect(result.pageTitle, 'Missing');
      expect(result.metaDescription, 'Missing');
      expect(result.canonicalUrl, 'Missing');
      expect(result.metaRobots, 'Missing');
      expect(result.firstH1, 'Missing');
      expect(result.h1Count, '0');
    });
  });

  group('SeoFetchService - HTTP Fetching', () {
    test('successful HTTP GET returns parsed SeoResult', () async {
      final mockClient = MockClient((request) async {
        return http.Response(
          '<html><head><title>Mocked Page</title></head></html>',
          200,
        );
      });

      final service = SeoFetchService(client: mockClient);
      final result = await service.fetchSeoData(
        'https://mocked.com',
        id: '100',
      );

      expect(result.pageTitle, 'Mocked Page');
      expect(result.httpStatus, '200');
      expect(result.fetchStatus, 'Success');
    });

    test('handles network exceptions gracefully without throwing', () async {
      final mockClient = MockClient((request) async {
        throw Exception('SocketException: Connection failed');
      });

      final service = SeoFetchService(client: mockClient);
      final result = await service.fetchSeoData(
        'https://failed.com',
        id: '101',
      );

      expect(result.fetchStatus, contains('Failed'));
      expect(result.pageTitle, 'Missing');
      expect(result.httpStatus, 'N/A');
    });
  });
}
