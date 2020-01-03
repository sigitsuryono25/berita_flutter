import 'dart:convert';

import 'package:berita_flutter/DetailNews.dart';
import 'package:berita_flutter/api/Api.dart';
import 'package:berita_flutter/api/ListBeritaResponse.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lauwba News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Lauwba News'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listNews = List<ListBeritaResponse>();
  var data = List<Data>();

  _getnews() {
    Api.getNews().then((response) {
      var data = json.decode(response.body);
      var item = ListBeritaResponse.fromJson(data);
      this.data = item.data;
    });
  }

  @override
  void initState() {
    super.initState();
    _getnews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: data.length ?? 0,
          itemBuilder: (BuildContext ctx, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailNews(
                              data: data[index],
                            )));
              },
              child: Card(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: 65.0,
                      alignment: Alignment.center,
                      child: Image.network(data[index].fotoNews),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(data[index].jdlNews,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(data[index].postOn,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
