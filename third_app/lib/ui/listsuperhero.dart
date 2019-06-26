import 'package:flutter/material.dart';

class ListSuperHero extends StatelessWidget {

  var id;
  var name;
  var fullname;
  var gambar;
  var image;
  var hair;
  var by;
  var race;

  ListSuperHero( Key key, this.id, this.name, this.fullname, this.gambar, this.image, this.hair, this.by, this.race );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          elevation: 5,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                child: SizedBox(
                  child: Image.network('https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/lg/3-abin-sur.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Dhitoos', style: TextStyle(fontSize: 20, fontFamily: 'diverplate'), ),
                        SizedBox(height: 10,),
                        Text('Aneditid'),
                        Text(''),
                        Text(''),
                        Text(''),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
