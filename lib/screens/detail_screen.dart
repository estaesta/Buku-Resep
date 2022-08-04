import 'package:flutter/material.dart';

import '../model/resep.dart';
import '../widgets/list_bahan.dart';

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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.resep.nama),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.resep.imageAsset,
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: 360,
              // width: 480,
              // fit: BoxFit.fitWidth,
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                     SizedBox(
                      height: 320,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white,
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              Text(
                                widget.resep.nama,
                                style:
                                    TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                widget.resep.description,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // toggle switch untuk mengganti satuan metric atau imperial
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Metric',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Switch(
                                      value: unitGram,
                                      onChanged: (value) {
                                        setState(() {
                                          unitGram = value;
                                        });
                                      },
                                    ),
                                    Text(
                                      "Imperial",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.favorite),
                                              onPressed: () {
                                                setState(() {
                                                  favState = !favState;
                                                  if (favState) {
                                                    favList.add(widget.resep.id);
                                                  } else {
                                                    favList.remove(widget.resep.id);
                                                  }
                                                });
                                              },
                                              color:
                                                  favState ? Colors.red : Colors.grey,
                                            ),
                                            if (favState) ...[
                                              Text(
                                                "Favorited",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red),
                                              ),
                                            ] else ...[
                                              Text(
                                                "Favorite",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
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
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            ...widget.resep.bahanBahan[key]!
                                                .map((bahan) => Text(
                                                      '${bahan.nama}    ${bahan.banyak} ${bahan.satuan}',
                                                      style: TextStyle(height: 1.5),
                                                    ))
                                                .toList(),
                                            SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Cara Membuat',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
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
                                                Text(
                                                  '\u2022',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    height: 1.25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Flexible(
                                                    child: Text(
                                                  cara,
                                                  style: TextStyle(fontSize: 16),
                                                )),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ))
                                    .toList(),
                              ),
                              SizedBox(
                                height: 150,
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
          ],
        ),
      ),
    );
  }
}
