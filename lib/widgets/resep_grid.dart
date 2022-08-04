import 'package:buku_resep/model/resep.dart';
import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';

enum SortResepGrid {
  terbaru,
  favorite
} 

class ResepGrid extends StatelessWidget {
  final int gridCount;
  final int itemCount;
  final SortResepGrid sortOption;
  final List<Resep> resep = List.from(resepList);

   ResepGrid({super.key, required this.gridCount, required this.itemCount, this.sortOption = SortResepGrid.terbaru})
  {
    switch (sortOption) {
      case SortResepGrid.favorite:
        resep.sort((b, a) => a.favoriteCount.compareTo(b.favoriteCount));
        break;
      case SortResepGrid.terbaru:
        resep.sort((b, a) => a.createdAt.compareTo(b.createdAt));
        break;
      default:
        resep.sort((a, b) => a.nama.compareTo(b.nama));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: gridCount,
        children: resep.take(itemCount).map((resep) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return DetailScreen(resep: resep);
              })));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        resep.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    resep.nama,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
