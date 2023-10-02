import 'package:flutter/material.dart';
import 'package:untitled/disease_data.dart';
import 'halamandetail.dart';
import 'package:untitled/page1.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Diseases"),
        backgroundColor: Colors.greenAccent,
        actions: [],
      ),
      body: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: listDisease.length,

        itemBuilder: (context, index) {
          if (index < listDisease.length) {
            final Diseases place = listDisease[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HalamanDetail(place: place);
                }));
              },
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.height / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          place.imgUrls,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        place.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
