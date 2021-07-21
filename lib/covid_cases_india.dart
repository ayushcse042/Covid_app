import 'package:flutter/material.dart';
import './models/country.dart';

class CovidCase extends StatelessWidget {
  final String name;
  final int cases;
  final data;
  const CovidCase({this.name, this.cases, this.data});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/fourth',
          arguments: Country(
            name: data['Country'],
            affected: data['TotalConfirmed'],
            death: data['TotalDeaths'],
            recovered: data["TotalRecovered"],
            active: data["TotalConfirmed"] -
                data["TotalRecovered"] -
                data["TotalDeaths"],
            newdeath: data["NewDeaths"],
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('$name'),
        ),
      ),
    );
  }
}
