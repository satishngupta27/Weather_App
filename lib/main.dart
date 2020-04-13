import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'selectionScreen.dart';
void main()=>runApp(MaterialApp(
  title:"Whether",
    home:MyApp(),),);
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String city = 'Agra';
  var temp;
  var description;
  var humadity;
  var currently;
  var windspeed;

  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectionScreen()),

    );
    setState(() {
      this.city = result;
      this.getWeather();
    });
  }
  void getWeather() async{
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=25501d5e5e8ec27ce3e9ee2b1fb75dba");
    var results= jsonDecode(response.body);
    setState(() {
      this.temp=results['main']['temp'];
      this.description=results['weather'][0]['description'];
      this.currently=results['weather'][0]['main'];
      this.humadity=results['main']['humidity'];
      this.windspeed=results['wind']['speed'];

    });
  }
  @override
  void initState(){
    super.initState();
    this.getWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },

      ),


      body: Column(
        children: <Widget>[

          Container(
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 10.0),
                  child: Text("currently in $city",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                Text(temp!=null?temp.toString()+"\u00b0":"loading",style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),),
                Padding(padding: EdgeInsets.only(top: 10.0),
                  child: Text(currently!=null?currently.toString():"loading",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                )
              ],
            ),
          ),

          Expanded(child: Padding(padding: EdgeInsets.all(20.0),
            child: ListView(children: <Widget>[
              ListTile(
                leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                title: Text("Temperature"),
                trailing: Text(temp!=null?temp.toString()+"\u00b0":"loading"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.cloud),
                title: Text("Whether"),
                trailing: Text(currently!=null?currently.toString():"loading"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.sun),
                title: Text("Humidity"),
                trailing: Text(humadity!=null?humadity.toString():"loading"),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.wind),
                title: Text("WindSpeed"),
                trailing: Text(windspeed!=null?windspeed.toString():"loading"),
              )
            ],),
          )
          ),


        ],

      ),

    );
  }
}
