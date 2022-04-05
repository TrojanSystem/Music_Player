import 'package:example/music_items/now_playing_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('HomeScreen'),
      ),
      body: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NowPlayingItem(),
            ),
          );
        },
        child: Align(
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
      ),
    );
  }
}
