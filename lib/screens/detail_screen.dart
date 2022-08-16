import 'package:flutter/material.dart';

import '../model/resep.dart';

class DetailScreen extends StatefulWidget {
  final Resep resep;

  const DetailScreen({super.key, required this.resep});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool unitGram = true;
  late bool favState;

  @override
  void initState() {
    favState = favList.contains(widget.resep.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.resep.nama),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                  child: Image.network(
                    widget.resep.imageAsset,
                    fit: BoxFit.cover,
                    width: 1200,
                    height: MediaQuery.of(context).size.height * 0.45,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: SizedBox(
                    width: 1210,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                        Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text(
                                  widget.resep.nama,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  widget.resep.description,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            children: [
                                              IconButton(
                                                icon:
                                                    const Icon(Icons.favorite),
                                                onPressed: () {
                                                  setState(() {
                                                    favState = !favState;
                                                    if (favState) {
                                                      favList
                                                          .add(widget.resep.id);
                                                      widget.resep.favoriteCount++;
                                                    } else {
                                                      favList.remove(
                                                          widget.resep.id);
                                                      widget.resep.favoriteCount--;
                                                    }
                                                  });
                                                },
                                                color: favState
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                              if (favState) ...[
                                                Text(
                                                  "Favorited (${widget.resep.favoriteCount})",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red),
                                                ),
                                              ] else ...[
                                                Text(
                                                  "Favorite (${widget.resep.favoriteCount})",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                              ]
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: widget.resep.bahanBahan.keys
                                      .map((key) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                key,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ...widget.resep.bahanBahan[key]!
                                                  .map((bahan) => Text(
                                                        '${bahan.nama}    ${bahan.banyak} ${bahan.satuan}',
                                                        style: const TextStyle(
                                                            height: 1.5),
                                                      ))
                                                  .toList(),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Cara Membuat',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: widget.resep.cara
                                      .map((cara) => Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    '\u2022',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      height: 1.25,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Flexible(
                                                      child: Text(
                                                    cara,
                                                    style: const TextStyle(
                                                        fontSize: 16),
                                                  )),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(
                                  height: 150,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
