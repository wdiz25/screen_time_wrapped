import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/app_classification.dart';
import '../../providers/category_provider.dart';
import '../../theme/slide_colors.dart';
import '../../theme/typography.dart';

class AppClassifierScreen extends StatefulWidget {
  const AppClassifierScreen({super.key});

  @override
  State<AppClassifierScreen> createState() => _AppClassifierScreenState();
}

class _AppClassifierScreenState extends State<AppClassifierScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _search = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryProvider>().loadInstalledApps();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlideColors.mint,
      appBar: AppBar(
        title: Text('App Categories', style: AppTypography.displayBold(size: 20)),
        backgroundColor: SlideColors.mint,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: TabBar(
          controller: _tabController,
          labelStyle: AppTypography.body(size: 14, weight: FontWeight.w700),
          unselectedLabelStyle: AppTypography.body(size: 14),
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Bad'),
            Tab(text: 'Good'),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              onChanged: (value) => setState(() => _search = value.toLowerCase()),
              decoration: InputDecoration(
                hintText: 'Search apps...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.black, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(color: Colors.black, width: 1.5),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          Expanded(
            child: Consumer<CategoryProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator(color: Colors.black));
                }

                return TabBarView(
                  controller: _tabController,
                  children: [
                    _AppList(
                      apps: _filter(provider.apps, _search),
                      onTap: (pkg) => provider.cycleCategory(pkg),
                    ),
                    _AppList(
                      apps: _filter(provider.badApps, _search),
                      onTap: (pkg) => provider.cycleCategory(pkg),
                    ),
                    _AppList(
                      apps: _filter(provider.goodApps, _search),
                      onTap: (pkg) => provider.cycleCategory(pkg),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<InstalledApp> _filter(List<InstalledApp> apps, String query) {
    if (query.isEmpty) return apps;
    return apps.where((a) =>
      a.appName.toLowerCase().contains(query) ||
      a.packageName.toLowerCase().contains(query)
    ).toList();
  }
}

class _AppList extends StatelessWidget {
  final List<InstalledApp> apps;
  final void Function(String packageName) onTap;

  const _AppList({required this.apps, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (apps.isEmpty) {
      return Center(
        child: Text('No apps here.', style: AppTypography.body(size: 16)),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: apps.length,
      separatorBuilder: (_, _) => const SizedBox(height: 6),
      itemBuilder: (_, i) => _AppTile(app: apps[i], onTap: onTap),
    );
  }
}

class _AppTile extends StatelessWidget {
  final InstalledApp app;
  final void Function(String) onTap;

  const _AppTile({required this.app, required this.onTap});

  Color _categoryColor(AppCategory cat) {
    return switch (cat) {
      AppCategory.good => SlideColors.mint,
      AppCategory.games => const Color(0xFFFF6B6B),
      AppCategory.entertainment => const Color(0xFFFF6B6B),
      AppCategory.socialMedia => const Color(0xFFFF6B6B),
      AppCategory.shopping => const Color(0xFFFF6B6B),
      AppCategory.neutral => const Color(0xFFDDDDDD),
    };
  }

  IconData _categoryIcon(AppCategory cat) {
    return switch (cat) {
      AppCategory.good => Icons.thumb_up_outlined,
      AppCategory.games => Icons.games_outlined,
      AppCategory.entertainment => Icons.movie_outlined,
      AppCategory.socialMedia => Icons.people_outlined,
      AppCategory.shopping => Icons.shopping_bag_outlined,
      AppCategory.neutral => Icons.remove_circle_outline,
    };
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: app.isHardcoded ? null : () => onTap(app.packageName),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black, width: 1.5),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 0),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(app.appName, style: AppTypography.body(size: 15, weight: FontWeight.w600)),
                  Text(app.packageName, style: AppTypography.label(size: 11)),
                ],
              ),
            ),
            if (app.isHardcoded)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(Icons.lock_outline, size: 14, color: Colors.black38),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: app.isHardcoded
                    ? _categoryColor(app.category).withValues(alpha: 0.5)
                    : _categoryColor(app.category),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_categoryIcon(app.category), size: 14),
                  const SizedBox(width: 4),
                  Text(
                    app.category.label,
                    style: AppTypography.label(size: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
