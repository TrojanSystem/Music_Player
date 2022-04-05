import 'package:flutter/material.dart';

import '../constants.dart';

class MusicItem extends StatefulWidget {
  String albumArt;
  String songTitle;
  String artistName;

  MusicItem({this.albumArt, this.artistName, this.songTitle});

  @override
  State<MusicItem> createState() => _MusicItemState();
}

class _MusicItemState extends State<MusicItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.albumArt),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      title: Text(
        widget.songTitle,
        style: kkAlbumScreen,
      ),
      subtitle: Text(
        widget.artistName,
        style: kkAlbumScreen,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '4:34',
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              setState(
                () {
                  isFavorite = !isFavorite;
                },
              );
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
