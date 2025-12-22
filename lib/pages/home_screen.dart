import 'package:flutter/material.dart';
import 'package:gmanga/widgets/bar_list.dart';
import 'package:gmanga/widgets/manhwa_graid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
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
          // تم حذف شريط البحث من هنا نهائياً
          
          // قائمة الكاتيجوري
          SliverToBoxAdapter(child: CategoryList()),

          // عنوان Manga List
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text("Manga List", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
          ),
          const MangaGridView(),
        ],
      ),
    );
  }
}