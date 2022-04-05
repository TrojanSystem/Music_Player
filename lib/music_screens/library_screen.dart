import 'package:example/music_items/now_playing_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../music_items/album_item.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _ww = MediaQuery.of(context).size.width;
    int columnCount = 2;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('LibraryScreen'),
          bottom: const PreferredSize(
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text('Albums'),
                  ),
                  Tab(
                    child: Text('Tracks'),
                  ),
                  Tab(
                    child: Text('Artist'),
                  ),
                  Tab(
                    child: Text('Recently'),
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(4.0)),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                Tab(
                  child: Container(
                    color: Colors.grey[850].withOpacity(0.9),
                    child: AnimationLimiter(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        padding: EdgeInsets.all(_w / 60),
                        crossAxisCount: columnCount,
                        children: List.generate(
                          5,
                          (int index) {
                            return AlbumItem(
                              index: index,
                              albumArt: 'images/2.jpg',
                              albumTitle: 'The Martial Mothers',
                              albumYear: '2000',
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => NowPlayingItem(),
                        ),
                      );
                    },
                    child: AnimationLimiter(
                      child: ListView.builder(
                        padding: EdgeInsets.all(_ww / 30),
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: 20,
                        itemBuilder: (BuildContext c, int i) {
                          return AnimationConfiguration.staggeredList(
                            position: i,
                            delay: const Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              horizontalOffset: 30,
                              verticalOffset: 300.0,
                              child: FlipAnimation(
                                duration: const Duration(milliseconds: 3000),
                                curve: Curves.fastLinearToSlowEaseIn,
                                flipAxis: FlipAxis.y,
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image:
                                                    AssetImage('images/1.jpg'),
                                                fit: BoxFit.cover),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          height: 80,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: ListTile(
                                          title: const Text(
                                            'Sew Alay',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          subtitle: const Text(
                                            'Dag Daniel',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () {},
                                            icon: const FaIcon(
                                              FontAwesomeIcons.ellipsisVertical,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  margin: EdgeInsets.only(bottom: _ww / 20),
                                  height: _ww / 4,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 40,
                                        spreadRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      padding: EdgeInsets.all(_ww / 30),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: 20,
                      itemBuilder: (BuildContext c, int i) {
                        return AnimationConfiguration.staggeredList(
                          position: i,
                          delay: const Duration(milliseconds: 100),
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            horizontalOffset: 30,
                            verticalOffset: 300.0,
                            child: FlipAnimation(
                              duration: const Duration(milliseconds: 3000),
                              curve: Curves.fastLinearToSlowEaseIn,
                              flipAxis: FlipAxis.y,
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: ListTile(
                                        title: const Text(
                                          'Dag Daniel',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: const Text(
                                          '1 Album 1 Song',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: const FaIcon(
                                            FontAwesomeIcons.ellipsisVertical,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: _ww / 20),
                                height: _ww / 4,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 40,
                                      spreadRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Tab(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      padding: EdgeInsets.all(_ww / 30),
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: 20,
                      itemBuilder: (BuildContext c, int i) {
                        return AnimationConfiguration.staggeredList(
                          position: i,
                          delay: const Duration(milliseconds: 100),
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            horizontalOffset: 30,
                            verticalOffset: 300.0,
                            child: FlipAnimation(
                              duration: const Duration(milliseconds: 3000),
                              curve: Curves.fastLinearToSlowEaseIn,
                              flipAxis: FlipAxis.y,
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage('images/1.jpg'),
                                              fit: BoxFit.cover),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        height: 80,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ListTile(
                                        title: const Text(
                                          'Sew Alay',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: const Text(
                                          'Dag Daniel',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {},
                                          icon: const FaIcon(
                                            FontAwesomeIcons.ellipsisVertical,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                margin: EdgeInsets.only(bottom: _ww / 20),
                                height: _ww / 4,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 40,
                                      spreadRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: ListTile(
                  leading: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('images/5.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  title: const Text(
                    'songTitle',
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: const Text(
                    'artistName',
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.pause_circle_filled_rounded,
                            color: Colors.black,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                width: double.infinity,
                height: 85,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
