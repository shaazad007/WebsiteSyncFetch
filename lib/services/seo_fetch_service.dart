import 'dart:async';

import 'package:html/dom.dart' as html_dom;
import 'package:html/parser.dart' as html_parser;
import 'package:http/http.dart' as http;

import '../models/seo_result.dart';

class SeoFetchService {
  final http.Client _client;

  SeoFetchService({http.Client? client}) : _client = client ?? http.Client();

  /// Validates and normalizes the input URL.
  /// Returns normalized URL string or null if invalid.
  String? normalizeUrl(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) return null;

    String candidate = trimmed;
    if (!candidate.startsWith('http://') && !candidate.startsWith('https://')) {
      candidate = 'https://$candidate';
    }

    final uri = Uri.tryParse(candidate);
    if (uri == null || !uri.hasAuthority || uri.host.isEmpty) {
      return null;
    }

    if (uri.scheme != 'http' && uri.scheme != 'https') {
      return null;
    }

    return uri.toString();
  }

  /// Parses HTML string and returns [SeoResult].
  SeoResult parseHtml({
    required String id,
    required String url,
    required int statusCode,
    required String? reasonPhrase,
    required String htmlContent,
  }) {
    final document = html_parser.parse(htmlContent);

    // Title
    final titleElement = document.querySelector('title');
    final pageTitle = (titleElement?.text.trim().isNotEmpty ?? false)
        ? titleElement!.text.trim()
        : 'Missing';

    // Meta Description
    final metaDescription = _getMetaContent(document, [
      'description',
      'og:description',
    ]);

    // Canonical URL
    final canonicalUrl = _getCanonicalUrl(document);

    // Meta Robots
    final metaRobots = _getMetaContent(document, ['robots']);

    // H1 tags
    final h1Elements = document.querySelectorAll('h1');
    final h1Count = h1Elements.length.toString();
    final firstH1 =
        (h1Elements.isNotEmpty && h1Elements.first.text.trim().isNotEmpty)
        ? h1Elements.first.text.trim()
        : 'Missing';

    final httpStatus = '$statusCode ${reasonPhrase ?? ''}'.trim();
    final isSuccess = statusCode >= 200 && statusCode < 300;
    final fetchStatus = isSuccess ? 'Success' : 'HTTP $statusCode';

    return SeoResult(
      id: id,
      url: url,
      httpStatus: httpStatus,
      pageTitle: pageTitle,
      metaDescription: metaDescription,
      canonicalUrl: canonicalUrl,
      metaRobots: metaRobots,
      firstH1: firstH1,
      h1Count: h1Count,
      fetchStatus: fetchStatus,
      timestamp: DateTime.now(),
    );
  }

  String _getMetaContent(html_dom.Document document, List<String> keyNames) {
    final normalizedKeys = keyNames.map((k) => k.toLowerCase()).toList();
    for (final meta in document.querySelectorAll('meta')) {
      final nameAttr = (meta.attributes['name'] ?? meta.attributes['property'])
          ?.toLowerCase();
      if (nameAttr != null && normalizedKeys.contains(nameAttr)) {
        final content = meta.attributes['content']?.trim();
        if (content != null && content.isNotEmpty) {
          return content;
        }
      }
    }
    return 'Missing';
  }

  String _getCanonicalUrl(html_dom.Document document) {
    for (final link in document.querySelectorAll('link')) {
      final relAttr = link.attributes['rel']?.toLowerCase();
      if (relAttr == 'canonical') {
        final href = link.attributes['href']?.trim();
        if (href != null && href.isNotEmpty) {
          return href;
        }
      }
    }
    return 'Missing';
  }

  /// Fetches SEO data for the given URL.
  Future<SeoResult> fetchSeoData(String inputUrl, {required String id}) async {
    final targetUrl = normalizeUrl(inputUrl);

    if (targetUrl == null) {
      return SeoResult.failure(
        id: id,
        url: inputUrl.trim().isEmpty ? 'Invalid URL' : inputUrl.trim(),
        errorMessage: 'Invalid or unusable URL format',
      );
    }

    try {
      final response = await _client
          .get(
            Uri.parse(targetUrl),
            headers: {
              'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) WebsiteSyncFetch/1.0',
            },
          )
          .timeout(const Duration(seconds: 15));

      return parseHtml(
        id: id,
        url: targetUrl,
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
        htmlContent: response.body,
      );
    } catch (e) {
      return SeoResult.failure(
        id: id,
        url: targetUrl,
        errorMessage: e.toString(),
      );
    }
  }
}
