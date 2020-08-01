import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                )),
          ],
          title: Text('Pick a City'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text("Agra"),
                    onTap: () {
                      Navigator.pop(context, 'Agra');
                    },
                  ),
                  ListTile(
                    title: Text("Delhi"),
                    onTap: () {
                      Navigator.pop(context, 'Delhi');
                    },
                  ),
                  ListTile(
                    title: Text("Vanarasi"),
                    onTap: () {
                      Navigator.pop(context, 'Vanarasi');
                    },
                  ),
                  ListTile(
                    title: Text("Mumbai"),
                    onTap: () {
                      Navigator.pop(context, 'Mumbai');
                    },
                  ),
                  ListTile(
                    title: Text("Sitapur"),
                    onTap: () {
                      Navigator.pop(context, 'Sitapur');
                    },
                  ),
                  ListTile(
                    title: Text("Lucknow"),
                    onTap: () {
                      Navigator.pop(context, 'Lucknow');
                    },
                  ),
                  ListTile(
                    title: Text("Gorakhpur"),
                    onTap: () {
                      Navigator.pop(context, 'Gorakhpur');
                    },
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
