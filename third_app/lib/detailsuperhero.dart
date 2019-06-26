import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:third_app/model/superheroitem.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class DetailSuperHeroPage extends StatefulWidget {
  var id;
  var image;

  DetailSuperHeroPage({Key key, this.id, this.image}) : super(key: key);

  @override
  _DetailSuperHeroPageState createState() => _DetailSuperHeroPageState();
}

class _DetailSuperHeroPageState extends State<DetailSuperHeroPage> {
  bool loading;
  SuperHeroItem superHeroItem;

  Future getDetailHero() async {
    setState(() {
      loading = true;
    });
    var url = 'https://akabab.github.io/superhero-api/api/id/${widget.id}.json';
    var res = await http.get(url);
    http.Response response = await http.get(url);
    var json = jsonDecode(res.body);
    int code = response.statusCode;
    if (code == 200) {
      setState(() {
        loading = false;
        superHeroItem = SuperHeroItem.fromJson(json);
      });
    } else {
      Toast.show("tidak ada detail Data", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      loading = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getDetailHero();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detail superhero'),
      ),
      body: loading == false
          ? SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            backgroundImage: NetworkImage(
                                "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/images/xs/1-a-bomb.jpg"),
                            radius: 70,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'jkjk',
                          style: TextStyle(
                              fontFamily: 'Diverplate', fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                    Text('Biography',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('data',),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text('Apperance',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    Text('Work',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('PowerStats',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              )
            ],
          ),
        ),
      )
          : CircularProgressIndicator(
        strokeWidth: 5,
        backgroundColor: Colors.green,
        valueColor: AlwaysStoppedAnimation(Colors.red),
      ),
    );
  }
}