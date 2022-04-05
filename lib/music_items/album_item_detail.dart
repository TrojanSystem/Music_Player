import 'package:example/data_provider/data_provider.dart';
import 'package:example/music_items/now_playing_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AlbumItemDetail extends StatelessWidget {
  final String image;
  String artist;
  final String albumTitle;
  final String year;

  AlbumItemDetail({this.artist, this.albumTitle, this.year, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Consumer<DataProvider>(
        builder: (context, entry, child) => Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(image),
                                        fit: BoxFit.cover),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 130,
                                ),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Album ',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              height: 4,
                                              width: 4,
                                            ),
                                          ),
                                          const Text(
                                            '17 songs',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              height: 4,
                                              width: 4,
                                            ),
                                          ),
                                          Text(
                                            year,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Text(
                                        albumTitle,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      child: Text(
                                        artist,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 160,
                                height: 45,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.play_circle_outline_outlined,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text('Play'),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 160,
                                height: 45,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.grey[850],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.shuffle_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        'Shuffle',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: ListView.builder(
                      itemCount: 17,
                      itemBuilder: (context, index) => ListTile(
                        leading: Text(
                          index < 9 ? '0${index + 1}' : '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        title: const Text(
                          'Not Afraid',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            const Text(
                              'Eminem',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 4,
                                width: 4,
                              ),
                            ),
                            const Text(
                              '4:43',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                          mainAxisSize: MainAxisSize.min,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => NowPlayingItem(),
                              ),
                            );
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.ellipsis,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    color: Colors.black,
                  ),
                )
              ],
            ),
            entry.isBacked
                ? Align(
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
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
