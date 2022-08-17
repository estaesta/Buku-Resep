import 'package:buku_resep/model/resep.dart';
import 'package:flutter/material.dart';

class FavButton extends StatefulWidget {
  final Resep resep;
  const FavButton({
    Key? key,
    required this.resep,
  }) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  late bool favState;

  @override
  void initState() {
    super.initState();
    favState = favList.contains(widget.resep.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            setState(() {
              favState = !favState;
              if (favState) {
                favList.add(widget.resep.id);
                widget.resep.favoriteCount++;
              } else {
                favList.remove(widget.resep.id);
                widget.resep.favoriteCount--;
              }
            });
          },
          color: favState ? Colors.red : Colors.grey,
        ),
        if (favState) ...[
          Text(
            "Favorited (${widget.resep.favoriteCount})",
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ] else ...[
          Text(
            "Favorite (${widget.resep.favoriteCount})",
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ]
      ],
    );
  }
}
