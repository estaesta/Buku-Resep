import 'package:buku_resep/model/resep.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/resep_grid.dart';
import 'detail_screen.dart';

class HomePage extends StatelessWidget {
  final Function callbackFunction;
  final TextEditingController controller;

  const HomePage(
      {super.key, required this.callbackFunction, required this.controller});

  @override
  Widget build(BuildContext context) {
    final List<Resep> resepFav = List.from(resepList);
    resepFav.sort((b, a) => a.favoriteCount.compareTo(b.favoriteCount));
    // var _controller = TextEditingController();

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 170,
                floating: false,
                pinned: true,
                toolbarHeight: 70,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 1,
                  collapseMode: CollapseMode.pin,
                  title: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CupertinoTextField(
                      controller: controller,
                      placeholder: 'Search',
                      onChanged: (String value) {
                        // print('The text has changed to: $value');
                        callbackFunction(1, true);
                      },
                    ),
                  ),
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: const Text(
                          'Buku Resep',
                          style: TextStyle(fontSize: 26, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ];
          }),
          body: Center(
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.0),
                  child: Text("Highlights",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 275,
                  ),
                  items: resepFav
                      .where((element) => element.createdAt.isAfter(
                          DateTime.now().subtract(const Duration(days: 7))))
                      .take(4)
                      .map((e) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return DetailScreen(resep: e);
                        })));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(e.imageAsset,
                                  width: 1000, height: 200, fit: BoxFit.cover),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              e.nama,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Populer",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              callbackFunction(1);
                            },
                          ),
                        ],
                      ),
                    ),
                    ResepGrid(
                      gridCount: 2,
                      itemCount: 4,
                      sortOption: SortResepGrid.favorite,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Terbaru",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              callbackFunction(1);
                            },
                          ),
                        ],
                      ),
                    ),
                    ResepGrid(
                      gridCount: 2,
                      itemCount: 4,
                      sortOption: SortResepGrid.terbaru,
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
