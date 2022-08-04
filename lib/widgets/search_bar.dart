import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/resep.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();
  List<Resep> _foundResep = [];
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _foundResep = [];
        });
      } else {
        setState(() {
          _foundResep = _search(_controller.text);
        });
      }
    });
  }

  //search function for the list of resep
  List<Resep> _search(String text) {
    text = text.toLowerCase();
    return resepList.where((Resep resep) {
      return resep.nama.toLowerCase().contains(text);
    }).toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _controller,
      placeholder: 'Search',
      onChanged: (String value) {
        print('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        print('Submitted text: $value');
      },
    );
  }
}
