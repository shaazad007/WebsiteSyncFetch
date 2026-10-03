import 'package:flutter/material.dart';

import '../controllers/seo_controller.dart';
import '../models/seo_result.dart';

class MainScreen extends StatefulWidget {
  final SeoController controller;

  const MainScreen({super.key, required this.controller});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final TextEditingController _urlController;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController();
    widget.controller.addListener(_onControllerUpdate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerUpdate);
    _urlController.dispose();
    super.dispose();
  }

  void _onControllerUpdate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Website Sync Fetch'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // URL input field
              TextField(
                key: const Key('url_input_field'),
                controller: _urlController,
                keyboardType: TextInputType.url,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Enter Webpage URL',
                  hintText: 'https://example.com',
                  prefixIcon: const Icon(Icons.language),
                  border: const OutlineInputBorder(),
                  errorText: controller.errorMessage,
                  suffixIcon: _urlController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _urlController.clear();
                            setState(() {});
                          },
                        )
                      : null,
                ),
                onChanged: (_) => setState(() {}),
                onSubmitted: (value) {
                  if (!controller.isLoading) {
                    controller.syncUrl(value);
                  }
                },
              ),
              const SizedBox(height: 12),

              // Action buttons bar
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                children: [
                  // Sync Button
                  ElevatedButton.icon(
                    key: const Key('sync_button'),
                    onPressed: controller.isLoading
                        ? null
                        : () => controller.syncUrl(_urlController.text),
                    icon: controller.isLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.sync),
                    label: Text(controller.isLoading ? 'Syncing...' : 'Sync'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),

                  // OK Button
                  OutlinedButton.icon(
                    key: const Key('ok_button'),
                    onPressed: () => controller.handleOk(_urlController),
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text('OK'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),

                  // Close App Button
                  OutlinedButton.icon(
                    key: const Key('close_app_button'),
                    onPressed: () => controller.closeApp(),
                    icon: const Icon(Icons.power_settings_new),
                    label: const Text('Close App'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      side: const BorderSide(color: Colors.redAccent),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Results Table Header
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 4,
                children: [
                  Text(
                    'SEO Results Table (${controller.results.length})',
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  if (controller.results.isNotEmpty)
                    Text(
                      'Scroll horizontally for columns',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // SEO Results Table
              Expanded(
                child: controller.results.isEmpty
                    ? Center(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest
                                .withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.table_chart_outlined,
                                size: 48,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'No SEO results yet',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Enter a URL above and press "Sync" to fetch SEO metrics.',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Card(
                        elevation: 1,
                        margin: EdgeInsets.zero,
                        clipBehavior: Clip.antiAlias,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              headingRowColor: WidgetStateProperty.all(
                                Theme.of(context).colorScheme.primaryContainer
                                    .withValues(alpha: 0.5),
                              ),
                              columns: const [
                                DataColumn(label: Text('#')),
                                DataColumn(label: Text('URL')),
                                DataColumn(label: Text('HTTP Status')),
                                DataColumn(label: Text('Page Title')),
                                DataColumn(label: Text('Meta Description')),
                                DataColumn(label: Text('Canonical URL')),
                                DataColumn(label: Text('Meta Robots')),
                                DataColumn(label: Text('First H1')),
                                DataColumn(label: Text('H1 Count')),
                                DataColumn(label: Text('Fetch Status')),
                                DataColumn(label: Text('Action')),
                              ],
                              rows: List.generate(
                                controller.results.length,
                                (index) => _buildDataRow(
                                  context,
                                  index,
                                  controller.results[index],
                                  controller,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataRow _buildDataRow(
    BuildContext context,
    int index,
    SeoResult item,
    SeoController controller,
  ) {
    final isSuccess = item.fetchStatus.toLowerCase().contains('success');

    return DataRow(
      key: ValueKey('seo_row_${item.id}'),
      cells: [
        DataCell(Text('${index + 1}')),
        DataCell(_constrainedText(item.url, width: 160)),
        DataCell(_constrainedText(item.httpStatus, width: 100)),
        DataCell(_constrainedText(item.pageTitle, width: 160)),
        DataCell(_constrainedText(item.metaDescription, width: 200)),
        DataCell(_constrainedText(item.canonicalUrl, width: 160)),
        DataCell(_constrainedText(item.metaRobots, width: 120)),
        DataCell(_constrainedText(item.firstH1, width: 160)),
        DataCell(_constrainedText(item.h1Count, width: 80)),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isSuccess
                  ? Colors.green.withValues(alpha: 0.15)
                  : Colors.red.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              item.fetchStatus,
              style: TextStyle(
                color: isSuccess ? Colors.green[800] : Colors.red[800],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        DataCell(
          IconButton(
            key: Key('delete_button_${item.id}'),
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            tooltip: 'Delete Row',
            onPressed: () => controller.deleteRow(item.id),
          ),
        ),
      ],
    );
  }

  Widget _constrainedText(String text, {double width = 150}) {
    final isMissing = text == 'Missing';
    return Container(
      constraints: BoxConstraints(maxWidth: width),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: isMissing
            ? TextStyle(color: Colors.grey[500], fontStyle: FontStyle.italic)
            : null,
      ),
    );
  }
}
