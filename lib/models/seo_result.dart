class SeoResult {
  final String id;
  final String url;
  final String httpStatus;
  final String pageTitle;
  final String metaDescription;
  final String canonicalUrl;
  final String metaRobots;
  final String firstH1;
  final String h1Count;
  final String fetchStatus;
  final DateTime timestamp;

  SeoResult({
    required this.id,
    required this.url,
    required this.httpStatus,
    required this.pageTitle,
    required this.metaDescription,
    required this.canonicalUrl,
    required this.metaRobots,
    required this.firstH1,
    required this.h1Count,
    required this.fetchStatus,
    required this.timestamp,
  });

  factory SeoResult.failure({
    required String id,
    required String url,
    required String errorMessage,
    String httpStatus = 'N/A',
  }) {
    return SeoResult(
      id: id,
      url: url,
      httpStatus: httpStatus,
      pageTitle: 'Missing',
      metaDescription: 'Missing',
      canonicalUrl: 'Missing',
      metaRobots: 'Missing',
      firstH1: 'Missing',
      h1Count: 'Missing',
      fetchStatus: 'Failed: $errorMessage',
      timestamp: DateTime.now(),
    );
  }
}
