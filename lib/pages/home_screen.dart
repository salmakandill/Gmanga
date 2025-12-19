import 'package:flutter/material.dart';
import 'package:gmanga/widgets/bar_list.dart';
import 'package:gmanga/widgets/manhwa_graid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String? searchQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('G', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
            Text('manga', style: TextStyle(color: Color(0xFF3A64B7), fontSize: 25, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search for manhwa...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() { searchQuery = null; });
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
                onChanged: (value) => setState(() {}),
                onSubmitted: (value) {
                  setState(() { searchQuery = value.isEmpty ? null : value; });
                },
              ),
            ),
          ),
          
          SliverToBoxAdapter(child: CategoryList()),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text("Manga List", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
          ),

          MangaGridView(searchQuery: searchQuery),
        ],
      ),
    );
  }
}