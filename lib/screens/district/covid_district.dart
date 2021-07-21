import 'dart:ui';
import 'package:flutter/material.dart';

class Coviddistrict extends StatelessWidget {
  final distcontroller = TextEditingController();

  void coronaupdate(String arg, BuildContext context) {
    Navigator.pushNamed(context, '/seventh',
        arguments: [arg, distcontroller.text]);
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('COVID-19')),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Text(
                'Please enter the name of District which details you want to see',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[600],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(29.0),
              child: TextField(
                controller: distcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the district name',
                ),
              ),
            ),
            ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Check corona Update',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),

                //color: Colors.blue[300],
                onPressed: () {
                  coronaupdate(arg, context);
                }),
          ],
        ),
      ),
    );
  }
}
