import 'package:example/music_items/album_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../music_items/music_item.dart';

class AlbumScreen extends StatefulWidget {
  AlbumScreen({Key key}) : super(key: key);

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/3.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 80),
                        decoration: BoxDecoration(
                          color: Colors.grey[850].withOpacity(0.9),
                        ),
                        child: TabBar(
                          indicatorColor: Colors.green,
                          // add it here
                          indicator: DotIndicator(
                            color: Colors.white,
                            distanceFromCenter: 10,
                            radius: 3,
                            paintingStyle: PaintingStyle.fill,
                          ),
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text('Popular'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text('Musics'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Text('Albums'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.black12,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Tab(
                              child: Container(
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) => MusicItem(
                                    albumArt: 'images/2.jpg',
                                    artistName: 'Eminem',
                                    songTitle: '8 Miles',
                                  ),
                                ),
                                color: Colors.grey[850].withOpacity(0.9),
                              ),
                            ),
                            Tab(
                              child: Container(
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) => MusicItem(
                                    albumArt: 'images/5.jpg',
                                    artistName: 'Eminem',
                                    songTitle: 'Not Afraid',
                                  ),
                                ),
                                color: Colors.grey[850].withOpacity(0.9),
                              ),
                            ),
                            Tab(
                              child: Container(
                                color: Colors.grey[850].withOpacity(0.9),
                                child: AnimationLimiter(
                                  child: GridView.count(
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    padding: EdgeInsets.all(_w / 60),
                                    crossAxisCount: columnCount,
                                    children: List.generate(
                                      5,
                                      (int index) {
                                        return AlbumItem(
                                          index: index,
                                          albumArt: 'images/4.jpg',
                                          albumTitle: 'The Martial Mothers',
                                          albumYear: '2000',
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('images/1.jpg'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[850].withOpacity(0.9),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  width: 100,
                  height: 100,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[850].withOpacity(0.9),
                  borderRadius: BorderRadius.circular(50),
                ),
                width: 100,
                height: 100,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 120.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Eminem',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
