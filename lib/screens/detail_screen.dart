import 'package:flutter/material.dart';

import '../model/resep.dart';
import '../widgets/fav_button.dart';

class DetailScreen extends StatelessWidget {
  final Resep resep;

  const DetailScreen({super.key, required this.resep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resep.nama),
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
                    resep.imageAsset,
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
                                  resep.nama,
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  resep.description,
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
                                          FavButton(
                                            resep: resep,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: resep.bahanBahan.keys
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
                                              ...resep.bahanBahan[key]!
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
                                  children: resep.cara
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
