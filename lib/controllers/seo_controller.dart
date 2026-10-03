import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/seo_result.dart';
import '../services/seo_fetch_service.dart';

class SeoController extends ChangeNotifier {
  final SeoFetchService _service;
  final List<SeoResult> _results = [];
  bool _isLoading = false;
  String? _errorMessage;

  SeoController({SeoFetchService? service})
    : _service = service ?? SeoFetchService();

  List<SeoResult> get results => List.unmodifiable(_results);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> syncUrl(String rawUrl) async {
    _errorMessage = null;

    final trimmed = rawUrl.trim();
    if (trimmed.isEmpty) {
      _errorMessage = 'Please enter a URL';
      notifyListeners();
      return;
    }

    final normalized = _service.normalizeUrl(trimmed);
    if (normalized == null) {
      _errorMessage = 'Invalid URL format. Example: https://example.com';
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    final id = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      final result = await _service.fetchSeoData(trimmed, id: id);
      _results.add(result);
    } catch (e) {
      _results.add(
        SeoResult.failure(id: id, url: normalized, errorMessage: e.toString()),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void deleteRow(String id) {
    _results.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void handleOk(TextEditingController textController) {
    textController.clear();
    _errorMessage = null;
    notifyListeners();
  }

  void closeApp() {
    SystemNavigator.pop();
  }
}
