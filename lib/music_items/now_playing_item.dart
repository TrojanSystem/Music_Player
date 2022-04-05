import 'package:example/data_provider/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NowPlayingItem extends StatefulWidget {
  NowPlayingItem({Key key}) : super(key: key);

  @override
  State<NowPlayingItem> createState() => _NowPlayingItemState();
}

class _NowPlayingItemState extends State<NowPlayingItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Provider.of<DataProvider>(context, listen: false)
                .changeStatusForNowPlaying();
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.keyboard_arrow_down,
          ),
        ),
        centerTitle: true,
        title: const Text('Now Playing'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.list,
            ),
          ),
        ],
      ),
      body: Consumer<DataProvider>(
        builder: (context, nowPlaying, child) => Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('images/1.jpg'),
                              fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 300,
                        height: 250,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(
                              () {
                                nowPlaying.isFavorite = !nowPlaying.isFavorite;
                              },
                            );
                          },
                          icon: Icon(
                            nowPlaying.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: nowPlaying.isFavorite
                                ? Colors.red
                                : Colors.white,
                            size: 30,
                          ),
                        ),
                        Column(
                          children: const [
                            Text(
                              'Not Afraid',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Eminem',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.ellipsis,
                            color: Colors.white,
                            size: 30,
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
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.shuffle,
                            color: Colors.grey[850],
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.circleLeft,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 40.0, right: 50),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.circleRight,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.repeat,
                            color: Colors.grey[850],
                            size: 30,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    )
                  ],
                ),
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
