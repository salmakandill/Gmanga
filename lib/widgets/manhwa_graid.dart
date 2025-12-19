import 'package:flutter/material.dart';
import '../server/manhwa_model.dart';
import '../server/manhwa_service.dart';
import 'manhwa_tile.dart';

class MangaGridView extends StatelessWidget {
  final String? searchQuery;
  const MangaGridView({super.key, this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MangaModel>>(
      future: MangaService().getAniListData(search: searchQuery), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final list = snapshot.data ?? [];

        if (list.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("No manhwa found")),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.all(12),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 0.55,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => MangaTile(manga: list[index]),
              childCount: list.length,
            ),
          ),
        );
      },
    );
  }
}