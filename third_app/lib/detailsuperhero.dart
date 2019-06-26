import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'dart:convert';

import 'model/superheroitem.dart';

class DetailSuperHeroPage extends StatefulWidget {

  var id;
  var image;

  DetailSuperHeroPage({Key key, this.id, this.image}) : super (key: key);

  @override
  _DetailSuperHeroPageState createState() => _DetailSuperHeroPageState();
}

class _DetailSuperHeroPageState extends State<DetailSuperHeroPage> {
  @override
  Widget build(BuildContext context) {
    SuperHeroItem superHeroItem;
    bool loading;
    Future getDetailHero() async {
      setState(() {
        loading = true;
      });
      var url = "https://akabab.github.io/superhero-api/api/all.json";
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
        Toast.show("tidak ada detail data", context, duration: Toast.LENGTH_SHORT);
        loading = false;
      }
    }

    @override
    void initState() {
      getDetailHero();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Text(superHeroItem.name),
      );
    }
    return Container();
  }
}
