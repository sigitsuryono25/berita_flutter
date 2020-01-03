import 'dart:convert';

import 'package:berita_flutter/api/Api.dart';
import 'package:berita_flutter/api/DetailResponse.dart' as prefix0;
import 'package:berita_flutter/api/ListBeritaResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailNews extends StatefulWidget {
  DetailNews({this.data});

  final Data data;

  @override
  State<StatefulWidget> createState() {
    return _DetailNewsState();
  }
}

class _DetailNewsState extends State<DetailNews> {
  prefix0.Data data;

  _getDetail() {
    Api.getDetailNews(widget.data.id).then((response) {
      var decode = jsonDecode(response.body);
      var list = prefix0.DetailResponse.fromJson(decode);
      data = list.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Berita"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(data.jdlNews),
            Image.network(baseUrl + '../news/' + data.fotoNews),
            Text(
              data.postOn,
              style: TextStyle(fontSize: 10),
            ),
            Text(
              data.ketNews,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
