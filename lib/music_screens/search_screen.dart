import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Provider.of<DataProvider>(context, listen: false)
            //     .changeStatusForNowPlaying();
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        backgroundColor: Colors.black,
        title: Form(
          key: formKey,
          child: TextFormField(
            onSaved: (value) {},
            decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontSize: 20,
                ),
                focusedBorder: InputBorder.none),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Get your favorite songs now',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.2,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Search for songs, artists and albums',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.2,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
