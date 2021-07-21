import 'package:flutter/material.dart';
import '../../models/api2.dart';
import '../../covid_case_state.dart';

class CovidIndia extends StatefulWidget {
  @override
  _CovidIndiaState createState() => _CovidIndiaState();
}

class _CovidIndiaState extends State<CovidIndia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Covid 19'),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return CovidStateCase(
            stateName: indianStatesData[index]['Province'],
            cases: indianStatesData[index]['Confirmed'],
          );
        },
        itemCount: indianStatesData.length,
      ),
    );
  }
}
