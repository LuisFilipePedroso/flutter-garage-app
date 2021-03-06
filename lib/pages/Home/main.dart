import 'package:flutter/material.dart';
import 'package:garageapp/pages/Info/main.dart';
import 'package:garageapp/pages/Profile/main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEFEFEF),
        body: ListView(children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(children: [
                      Row(
                          children: [
                            Text(
                              "Luis's Garage",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfileScreen(
                                              user: 'Luis Filipe Pedroso')),
                                    );
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        'https://github.com/LuisFilipePedroso.png'),
                                  )),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center),
                    ]),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Text("My Cars",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff00194b))),
                        Container(
                          child: GestureDetector(
                              child: Column(
                                children: [
                                  Padding(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Image.network(
                                        'https://pics.porsche.com/rtt/iris?COSY-EU-100-17116bXqc6eP3Hi1qwT9HcnyInrHKxJTTPE3kUWFYRpwY4nkAH3Uko69AFcLwMQjLVYn47uPi60JemN%25nBXHcnPWf7KPbEGLfqlSPYtjN9yvN3dMGJVWL%25tFXu2LFGCg4YXyvE46jj0iD2GDcmw98gfUdGXVCofUQrQ9wASWTB8ZuuBeex5%2513XhQD9SXnAYyiIu7%25GeP3JLlVSKCvXJzdf4EY%25IoJydODmQTgf9sMN8tDR',
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(top: 16.0),
                                  ),
                                  Padding(
                                    child: Text(
                                      "Porsche Taycan Turbo S",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    padding: EdgeInsets.only(top: 16.0),
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InfoScreen(title: 'Details')),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
