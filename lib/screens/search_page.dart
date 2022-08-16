import 'package:buku_resep/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import '../model/resep.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController controller;
  final bool autofocus;

  const SearchPage(
      {super.key, required this.controller, this.autofocus = false});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Resep> _foundResep = [];

  @override
  void initState() {
    _foundResep = List.from(resepList);
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Resep> results = [];
    if (enteredKeyword.isEmpty) {
      results = List.from(resepList);
    } else {
      results = resepList
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.white,
                      child: TextField(
                        controller: widget.controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          suffixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 11, horizontal: 16),
                        ),
                        onChanged: (String value) {
                          _runFilter(value);
                        },
                        autofocus: widget.autofocus,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 1,
                        child: Text('Most Favorite'),
                      ),
                      const PopupMenuItem(
                        value: 2,
                        child: Text('Least Favorite'),
                      ),
                      const PopupMenuItem(
                        value: 3,
                        child: Text('Most Recent'),
                      ),
                      const PopupMenuItem(
                        value: 4,
                        child: Text('Least Recent'),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    switch (value) {
                      case 1:
                        setState(() {
                          _foundResep.sort((a, b) =>
                              a.favoriteCount.compareTo(b.favoriteCount));
                        });
                        break;
                      case 2:
                        setState(() {
                          _foundResep.sort((a, b) =>
                              b.favoriteCount.compareTo(a.favoriteCount));
                        });
                        break;
                      case 3:
                        setState(() {
                          _foundResep.sort(
                              (a, b) => a.createdAt.compareTo(b.createdAt));
                        });
                        break;
                      case 4:
                        setState(() {
                          _foundResep.sort(
                              (a, b) => b.createdAt.compareTo(a.createdAt));
                        });
                        break;
                    }
                  },
                  icon: const Icon(Icons.sort),
                  iconSize: 24,
                  elevation: 16,
                )
              ],
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
                    children: const [
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
                  visualDensity: const VisualDensity(
                    vertical: 4,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
