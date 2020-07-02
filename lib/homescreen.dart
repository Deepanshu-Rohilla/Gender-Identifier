import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _nameController = TextEditingController();
  var result;

  predictGender(String name) async {

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
              onPressed: _nameController.text.length>0 ?(){} : null,
              child: Text('Predict'),
            ),
            result !=null ?
            Text('Result') : null,
          ],
        ),
      ),
    );
  }
}
