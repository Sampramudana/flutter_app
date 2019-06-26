import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'dart:convert';

import 'model/superheroitem.dart';
import 'ui/listsuperhero.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List responseListData;
  bool loading;
  String isiResponse = '';

  Future getSuperHeroData() async {
    setState(() {
      loading = true;
    });
    var url = "https://akabab.github.io/superhero-api/api/all.json";
    var res = await http.get(url);
    List json = jsonDecode(res.body);
    http.Response response = await http.get(url);

    int code = response.statusCode;
    if (code == 200) {
      setState(() {
        responseListData=json;
        loading = false;
        Toast.show("Berhasil", context, duration: Toast.LENGTH_SHORT);
        isiResponse = responseListData.toString();
      });
    } else {
      Toast.show("Tidak ada data", context, duration: Toast.LENGTH_SHORT);
      loading = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getSuperHeroData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(0.0),
          child: isiResponse != '' ?
          ListView.builder(
            shrinkWrap: true,
            itemCount: responseListData == null ? 0 : responseListData.length,
            itemBuilder: (BuildContext context, int position) {
              SuperHeroItem superHeroItem = SuperHeroItem.fromJson(responseListData[position]);
              return ListSuperHero();
            },
          ) : CircularProgressIndicator(),
        ),
      )
    );
  }
}
