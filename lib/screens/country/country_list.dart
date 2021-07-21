import 'package:flutter/material.dart';
import '../../list_country.dart';

class CountryListScreen extends StatefulWidget {
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('COVID -19'),
        ),
      ),
      body: Column(
        children: [
          CountryList(),
        ],
      ),
    );
  }
}
