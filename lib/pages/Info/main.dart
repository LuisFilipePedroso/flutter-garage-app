import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:garageapp/utils/main.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class InfoScreen extends StatefulWidget {
  InfoScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  Future<List<Info>> _getInfo() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/bUApgHGyhu?indent=2");

    var jsonData = json.decode(data.body);

    List<Info> infos = [];

    for (var u in jsonData) {
      // print('JSON DATA: ${u}');
      Info info = Info(u["title"], u["subTitle"], u["icon"],
          u["total"].toString(), u["unit"]);

      infos.add(info);
    }

    return infos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xff4778f3),
      ),
      backgroundColor: Color(0xffEFEFEF),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: _getInfo(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.separated(
                itemCount: snapshot.data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 16,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        border: Border.all(
                          color: Color(0xff333),
                          width: 1,
                        ),
                        gradient: LinearGradient(
                          colors: [Color(0xff6ebaff), Color(0xff4778f3)],
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(snapshot.data[index].subTitle,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                              Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Text(snapshot.data[index].title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 32, bottom: 32),
                            child: Image.network(
                              snapshot.data[index].icon,
                              alignment: Alignment.center,
                              width: 80,
                              height: 80,
                            )),
                        Container(
                            child: Row(
                          children: [
                            Text(
                              snapshot.data[index].total,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(snapshot.data[index].unit,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ))
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
