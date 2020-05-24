import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

void main() => runApp(new MaterialApp(
  home: new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: Text("MARVEL"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: new Container(
          child: new Center(
            child: new FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('json_assets/heroes.json'),
              builder: (context, snapshot) {
                var jsonData = json.decode(snapshot.data.toString());
                return new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text("Nombre: " + jsonData[index]["nombre"]),
                          new Text("Identidad: " + jsonData[index]["identidad"]),
                          new Text("Edad: " + jsonData[index]["edad"]),
                          new Text("Altura: " + jsonData[index]["altura"]),
                          new Text("Género: " + jsonData[index]["genero"]),
                          new Text("Descripcion: " + jsonData[index]["descripcion"]),
                        ],
                      ),
                    );
                  },
                  itemCount: jsonData == null ? 0 : jsonData.length,
                );
              },
            ),
          ),
        ));
  }
}
