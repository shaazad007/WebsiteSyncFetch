import 'package:flutter/material.dart';

import 'controllers/seo_controller.dart';
import 'ui/main_screen.dart';

void main() {
  runApp(const WebsiteSyncFetchApp());
}

class WebsiteSyncFetchApp extends StatefulWidget {
  const WebsiteSyncFetchApp({super.key});

  @override
  State<WebsiteSyncFetchApp> createState() => _WebsiteSyncFetchAppState();
}

class _WebsiteSyncFetchAppState extends State<WebsiteSyncFetchApp> {
  late final SeoController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SeoController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Website Sync Fetch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: MainScreen(controller: _controller),
    );
  }
}
