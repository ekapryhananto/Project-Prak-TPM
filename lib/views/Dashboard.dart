import 'package:flutter/material.dart';
import 'SeasonAnimePage.dart';
import 'TopAnimePage.dart';
import 'MangaPage.dart';

class Dashboard extends StatefulWidget {
  // const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.book),
                    text: 'Top Mangaa',
                  ),
                  Tab(
                    icon: Icon(Icons.movie_filter_sharp),
                    text: 'Session Anime',
                  ),
                  Tab(
                    icon: Icon(Icons.local_fire_department),
                    text: 'Top Anime',
                  ),
                ],
              ),
              title: Text('Manga List'),
            ),
            body: TabBarView(
              children: <Widget>[
                MangaPage(),
                TopAnimePage(),
                SeasonAnime(),
              ],
            ),
          ),
        );
  }
}