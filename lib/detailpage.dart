import 'package:flutter/material.dart';
import 'package:kuispemrogramanmobile187/top_album.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  final TopAlbum album;

  const Detail({Key? key, required this.album}) : super(key: key);

  void _launchAlbumUrl() async {
    String albumUrl = album.albumurl;

    if (await canLaunch(albumUrl)) {
      await launch(albumUrl);
    } else {
      throw 'Could not launch $albumUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.albumName),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              _launchAlbumUrl();
            },
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.network(album.imageUrls),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${album.albumName}',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text('${album.singer}', textAlign: TextAlign.center,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 5),
                        Text('${album.releaseDate}'),
                        SizedBox(width: 20),
                        Icon(Icons.album),
                        SizedBox(width: 5),
                        Text('${album.source}'),
                      ],
                    ),
                    SizedBox(height: 10),

                    Container(
                      color: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Song List:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      children: album.songs
                          .map(
                            (song) => ListTile(
                          title: Text(
                            song,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                          .toList(),
              ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
