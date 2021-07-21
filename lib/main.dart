import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/home.dart';
import './screens/country/global.dart';
import './screens/country/country_report.dart';
import './screens/country/country_list.dart';
import './screens/district/covid_dist_data.dart';
import './screens/district/covid_district.dart';
import './screens/district/covid_indian_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: Home(),
      routes: {
        // '/first': (context) => Home(),
        '/second': (context) => GlobalData(),
        '/third': (context) => CountryListScreen(),
        '/fourth': (context) => CountryReport(),
        '/fifth': (context) => CovidIndia(),
        '/sixth': (context) => Coviddistrict(),
        '/seventh': (context) => Coviddistrictdata(),
      },
    );
  }
}
