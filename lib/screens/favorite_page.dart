import 'package:buku_resep/screens/detail_screen.dart';
import 'package:flutter/material.dart';

import '../model/resep.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Resep> _foundResep = [];
  List<Resep> resepFav = [];

  @override
  void initState() {
    for (int index in favList) {
      resepFav.add(resepList[index]);
    }
    _foundResep = List.from(resepFav);
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Resep> results = [];
    if (enteredKeyword.isEmpty) {
      results = List.from(resepFav);
    } else {
      results = resepFav
          .where((resep) =>
              resep.nama.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundResep = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: SizedBox(
            width: 1200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    suffixIcon: Icon(Icons.search),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                  ),
                  onChanged: (String value) {
                    _runFilter(value);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _foundResep.length,
          itemBuilder: (BuildContext context, int index) {
            Resep resep = _foundResep[index];
            return Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 1200,
                child: ListTile(
                  title: Text(resep.nama),
                  subtitle: Text(
                    resep.description,
                    softWrap: false,
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      resep.imageAsset,
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                  ),
                  trailing: Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            favList.remove(resep.id);
                            resepFav.remove(resep);
                            resep.favoriteCount--;
                            _foundResep.remove(resep);
                          });
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          resep: resep,
                        ),
                      ),
                    );
                  },
                  visualDensity: const VisualDensity(vertical: 4),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
