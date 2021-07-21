import 'package:flutter/material.dart';
import './covid_cases_india.dart';
import 'models/api2.dart';

class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext ctx, int index) {
            return CovidCase(
                data: countryData[index],
                name: countryData[index]['Country'],
                cases: countryData[index]['TotalConfirmed']);
          },
          itemCount: countryData.length,
        ),
      ),
    );
  }
}
