import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pick an option'),
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
                    title: Text("Vanaras"),
                    onTap: () {
                      Navigator.pop(context, 'Vanaras');
                    },
                  ),
                  ListTile(
                    title: Text("Mumbai"),
                    onTap: () {
                      Navigator.pop(context, 'Mumbai');
                    },
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
