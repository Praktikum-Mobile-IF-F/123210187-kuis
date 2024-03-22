import 'package:flutter/material.dart';
import 'package:kuispemrogramanmobile187/top_album.dart';

class Detail extends StatelessWidget {
  final TopAlbum album;

  const Detail({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.albumName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(album.imageUrls),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${album.albumName}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    Text('${album.singer}'),
                    Row(
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
                  Text(
                    'Songs:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: album.songs
                        .map((song) => Text(' - $song'))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}