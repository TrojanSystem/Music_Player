import 'package:example/music_items/album_item_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AlbumItem extends StatefulWidget {
  final int index;
  final String albumArt;
  final String albumTitle;
  final String albumYear;

  const AlbumItem(
      {Key key, this.index, this.albumArt, this.albumTitle, this.albumYear})
      : super(key: key);

  @override
  _AlbumItemState createState() => _AlbumItemState();
}

class _AlbumItemState extends State<AlbumItem> {
  @override
  Widget build(BuildContext c) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AlbumItemDetail(
              image: 'images/4.jpg',
              albumTitle: 'Marshal Mother',
              artist: 'Eminem',
              year: '2000',
            ),
          ),
        );
      },
      child: AnimationConfiguration.staggeredGrid(
        position: widget.index,
        duration: const Duration(milliseconds: 500),
        columnCount: columnCount,
        child: ScaleAnimation(
          duration: const Duration(milliseconds: 900),
          curve: Curves.fastLinearToSlowEaseIn,
          scale: 1.5,
          child: FadeInAnimation(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GridTile(
                  child: GestureDetector(
                    child: Image(
                      image: AssetImage(widget.albumArt),
                      fit: BoxFit.cover,
                    ),
                  ),
                  footer: GridTileBar(
                    backgroundColor: Colors.red.withOpacity(0.4),
                    title: Text(
                      widget.albumTitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      widget.albumYear,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              margin: EdgeInsets.only(
                  bottom: _w / 30, left: _w / 60, right: _w / 60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
      ),
    );
  }
}
