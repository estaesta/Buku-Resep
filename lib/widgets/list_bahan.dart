import 'package:buku_resep/model/resep.dart';
import 'package:flutter/material.dart';

class ListBahan extends StatelessWidget {
  final Resep resep;
  late Map bahanBahan = resep.bahanBahan;
  late List ee = ['a','b'];

  ListBahan({super.key, required this.resep});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                'Ingredients',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                children: bahanBahan.keys
                    .map((key) => Text(key))
                    .toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
