import 'package:flutter/material.dart';
import 'package:gmanga/server/manhwa_service.dart';
import 'package:gmanga/widgets/manhwa_tile.dart';

class CategoryPage extends StatelessWidget {
  final String genreName;

  const CategoryPage({
    super.key,
    required this.genreName,
    required int genreId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(genreName, style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: MangaService().getAniListData(genre: genreName, limit: 50),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError ||
              !snapshot.hasData) {
            return const Center(child: Text("Category Is Impty!"));
          }

          final list = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),

            itemCount: 50,
            itemBuilder: (context, index) {
              return MangaTile(manga: list[index]);
            },
          );
        },
      ),
    );
  }
}

extension on Object {
  operator [](int other) {}
}