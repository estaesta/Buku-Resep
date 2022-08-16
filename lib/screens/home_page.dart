import 'package:buku_resep/model/resep.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return Home(
            controller: controller,
            callbackFunction: callbackFunction,
            resepFav: resepFav,
            gridCount: 2,
            itemCount: 4,
          );
        } else if (constraints.maxWidth < 1200) {
          return Home(
              controller: controller,
              callbackFunction: callbackFunction,
              resepFav: resepFav,
              gridCount: 3,
              itemCount: 6);
        } else {
          return Home(
              controller: controller,
              callbackFunction: callbackFunction,
              resepFav: resepFav,
              gridCount: 4,
              itemCount: 8);
        }
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
    required this.controller,
    required this.callbackFunction,
    required this.resepFav,
    required this.gridCount,
    required this.itemCount,
  }) : super(key: key);

  final TextEditingController controller;
  final Function callbackFunction;
  final List<Resep> resepFav;
  final int gridCount;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150,
                pinned: true,
                toolbarHeight: 80,
                snap: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 1,
                  collapseMode: CollapseMode.pin,
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 1200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Colors.white,
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              suffixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 11,
                              ),
                            ),
                            onChanged: (String value) {
                              callbackFunction(1, true);
                            },
                          ),
                        ),
                      ),
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
          body: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: 1200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        autoPlay: true,
                        aspectRatio: 1.5,
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
                                      width: 1000, fit: BoxFit.cover),
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
                        SizedBox(
                          width: 1100,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 26.0),
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
                        ),
                        ResepGrid(
                          gridCount: gridCount,
                          itemCount: itemCount,
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
                          gridCount: gridCount,
                          itemCount: itemCount,
                          sortOption: SortResepGrid.terbaru,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
