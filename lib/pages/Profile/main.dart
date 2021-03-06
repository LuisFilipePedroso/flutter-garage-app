import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:garageapp/utils/main.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key, this.user}) : super(key: key);

  final String user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<User> _getUser() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/crbVgtvsQy?indent=2");

    var jsonData = json.decode(data.body);

    User user = User(
        jsonData["name"],
        jsonData["avatar"],
        jsonData["email"],
        jsonData["cars"].toString(),
        jsonData["inspections"].toString(),
        jsonData["lastInspection"]);

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.user),
          backgroundColor: Color(0xff4778f3),
        ),
        backgroundColor: Color(0xffEFEFEF),
        body: FutureBuilder(
          future: _getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return SafeArea(
                  child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff333),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                snapshot.data.avatar,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.user,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text("luis_filipe42@outlook.com",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 32.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Carros: ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(snapshot.data.cars,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Revisões feitas: ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(snapshot.data.inspections,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Última Revisão: ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(snapshot.data.lastInspection,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    )
                  ],
                ),
              ));
            }
          },
        ));
  }
}
