
import 'package:buku_resep/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/resep.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Resep> _foundResep = [];

  @override
  void initState() {
    // _foundResep = resepListCopy;
    _foundResep = List.from(resepList);
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Resep> results = [];
    if (enteredKeyword.isEmpty) {
      // results = resepListCopy;
      results = List.from(resepList);
    } else {
      // results = resepListCopy
      results = resepList
          .where((resep) =>
              resep.nama.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundResep= results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CupertinoTextField(
                      placeholder: 'Search',
                      onChanged: (String value) {
                        // print('The text has changed to: $value');
                      },
                    ),
                  ),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: favList.length,
            itemBuilder: (BuildContext context, int index) {
              Resep resepFav = resepList[favList[index]];
              return ListTile(
                title: Text('${resepFav.nama}'),
                subtitle: Text('${resepFav.description}', softWrap: false,),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    '${resepFav.imageAsset}',
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                ),
                trailing: Column(
                  children: [
                    //delete icon
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          favList.removeAt(index);
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
                        resep: resepFav,
                      ),
                    ),
                  );
                },
                visualDensity: VisualDensity(vertical: 4),
              );
            },
          ),
        ),
      ),
    );
  }
}
