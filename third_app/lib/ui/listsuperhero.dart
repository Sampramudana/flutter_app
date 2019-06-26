import 'package:flutter/material.dart';
import 'package:third_app/detailsuperhero.dart';

class ListSuperHero extends StatelessWidget {

  var id;
  var name;
  var fullname;
  var gender;
  var image;
  var hair;
  var by;
  var race;

  ListSuperHero({Key key, this.id, this.name, this.fullname, this.gender, this.image, this.hair, this.by, this.race}):super(key:key)  ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: (){
          var pindahHalaman = MaterialPageRoute(builder: (context)=> DetailSuperHeroPage(id: id, image: image));
          Navigator.push(context, pindahHalaman);
        },
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
                  child: Image.network('$image',
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text('$name', style: TextStyle(fontSize: 20, fontFamily: 'diverplate'),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text('$fullname', style: TextStyle(fontSize: 15,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text('$gender', style: TextStyle(fontSize: 15,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text('$hair', style: TextStyle(fontSize: 15,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text('$by', style: TextStyle(fontSize: 15,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text('$race', style: TextStyle(fontSize: 15,),
                          ),
                        ),
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
