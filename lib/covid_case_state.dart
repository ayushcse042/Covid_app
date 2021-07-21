import 'package:flutter/material.dart';

class CovidStateCase extends StatelessWidget {
  final String stateName;
  final int cases;
  CovidStateCase({this.cases, this.stateName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(" $stateName "),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/sixth', arguments: stateName);
      },
    );
  }
}
