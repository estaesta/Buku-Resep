import 'package:buku_resep/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/resep.dart';

class SearchPage extends StatefulWidget {

  final TextEditingController controller;
  final bool autofocus;

  const SearchPage({super.key, required this.controller, this.autofocus = false});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Resep> _foundResep = [];
  // final List<Resep> resepListCopy = List.from(resepList);


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
                    child: Row(
                      children: [
                        Expanded(
                          child: CupertinoTextField(
                            controller: widget.controller,
                            placeholder: 'Search',
                            onChanged: (String value) {
                              // print('The text has changed to: $value');
                              _runFilter(value);
                            },
                            autofocus: widget.autofocus,
                            // onSubmitted: (String value) {
                            //   print('Submitted text: $value');
                            // },
                          ),
                        ),
                        SizedBox(width: 16),
                        PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: Text('Most Favorite'),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text('Least Favorite'),
                                value: 2,
                              ),
                              PopupMenuItem(
                                child: Text('Most Recent'),
                                value: 3,
                              ),
                              PopupMenuItem(
                                child: Text('Least Recent'),
                                value: 4,
                              ),
                            ];
                          },
                          onSelected: (value) {
                            switch (value) {
                              case 1:
                                print('Favorite');
                                setState(() {
                                  // resepListCopy.sort((a, b) => a.favoriteCount.compareTo(b.favoriteCount));
                                  _foundResep.sort((a, b) => a.favoriteCount.compareTo(b.favoriteCount));
                                });
                                break;
                              case 2:
                                print('Least Favorite');
                                setState(() {
                                  // resepListCopy.sort((a, b) => b.favoriteCount.compareTo(a.favoriteCount));
                                  _foundResep.sort((a, b) => b.favoriteCount.compareTo(a.favoriteCount));
                                });
                                break;
                              case 3:
                                print('Most Recent');
                                setState(() {
                                  // resepListCopy.sort((a, b) => a.createdAt.compareTo(b.createdAt));
                                  _foundResep.sort((a, b) => a.createdAt.compareTo(b.createdAt));
                                });
                                break;
                              case 4:
                                print('Least Recent');
                                setState(() {
                                  // resepListCopy.sort((a, b) => b.createdAt.compareTo(a.createdAt));
                                  _foundResep.sort((a, b) => b.createdAt.compareTo(a.createdAt));
                                });
                                break;
                            }
                          },
                          icon: Icon(Icons.sort),
                          iconSize: 24,
                          elevation: 16,
                        )
                      ],
                    ),
                  ),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            // itemCount: resepListCopy.length,
            itemCount: _foundResep.length,
            itemBuilder: (BuildContext context, int index) {
              // Resep resep = resepListCopy[index];
              Resep resep = _foundResep[index];
              return ListTile(
                title: Text('${resep.nama}'),
                subtitle: Text('${resep.description}', softWrap: false,),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    '${resep.imageAsset}',
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                ),
                trailing: Column(
                  children: [
                    Icon(Icons.keyboard_arrow_right),
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
                visualDensity: VisualDensity(vertical: 4),
              );
            },
          ),
        ),
      ),
    );
  }
}
