import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  title: Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SearchBar(),
                        )),
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Welcome',
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
            child: Container(

              ),
          )),
    );
  }
}
