import 'package:flutter/material.dart';
import 'package:untitled/disease_data.dart';
import 'package:untitled/page1.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  final Diseases place;

  HalamanDetail({Key? key, required this.place}) : super(key: key);

  @override
  _HalamanDetailState createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _openMapLink(String imgUrls) async {
    if (await canLaunch(imgUrls)) {
      await launch(imgUrls);
    } else {
      throw 'Tidak dapat membuka: $imgUrls';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Detail"),
        actions: [
          IconButton(
            icon: isFavorite ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_border),
            onPressed: () {
              _toggleFavorite();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(isFavorite ? 'Ditambahkan ke Favorit'
                        : 'Dihapus dari Favorit'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(widget.place.imgUrls, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.place.name,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.place.plantName,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        "",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "${widget.place.symptom}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        widget.place.nutshell[0],
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        widget.place.nutshell[1],
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        widget.place.nutshell[2],
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        widget.place.nutshell[3],
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _openMapLink(widget.place.imgUrls);
                    },
                    child: Text("Lihat Gambar"),
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
