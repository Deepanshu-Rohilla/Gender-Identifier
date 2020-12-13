import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _nameController = TextEditingController();
  var result;

  predictGender(String name) async {
      var url = "https://api.genderize.io/?name=$name";
      var response = await http.get(url);
      var body = jsonDecode(response.body);

      result =  "$name has gender ${body['gender']} with a probability of ${body['probability']}";
      setState(() {

      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender Predictor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Enter a name to predict its gender'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
            ),
            RaisedButton(
              onPressed:() => predictGender(_nameController.text),
              child: Text('Predict'),
            ),
            result !=null ?
            Text(result) : Text(''),
          ],
        ),
      ),
    );
  }
}
