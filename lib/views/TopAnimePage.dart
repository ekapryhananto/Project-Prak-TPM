// ignore_for_file: file_names

// ignore: file_names
import 'package:flutter/material.dart';
import 'package:projectmanga/models/AnimeManga.dart';
import 'package:projectmanga/viewmodels/fetchTopAnime.dart';
import 'package:http/http.dart' as http;
import 'package:projectmanga/detail/Detail.dart';

class TopAnimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Most Popular Anime All Time'),
      ),
      body: FutureBuilder<List<Anime>>(
        future: fetchAnime(http.Client()),
        builder: (context,snapshot){
          if(snapshot.hasError)print(snapshot.error);
          return snapshot.hasData
              ?AnimeList(anime:snapshot.data)
              :Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class AnimeList extends StatelessWidget {
  final List<Anime> anime;
  AnimeList({Key key, this.anime}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: anime.length,
      itemBuilder: (context,index){
        return new GestureDetector(
          // Navigasi saat klik
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => DetailScreen(
                  anime: anime[index],
                )
            ));
          },

          child: new Card(
            child: new Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    '${anime[index].poster}',
                    width: 75,
                  ),
                ),

                // Expanded agar wrap overflow
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '${anime[index].titles}',
                            style: Theme.of(context).textTheme.headline6,
                            softWrap: true,
                          ),
                        ),
                        Text('Release Date : ${anime[index].startDate}')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
