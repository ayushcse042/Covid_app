import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/api2.dart';

TextStyle textstyle = TextStyle(
  fontSize: 17,
);

class CovidData extends StatefulWidget {
  @override
  State<CovidData> createState() => _CovidDataState();
}

class _CovidDataState extends State<CovidData> {
  Future<void> getStatesData() async {
    http.Response response = await http.get(indianStatesUrl);
    if (response.statusCode == 200) {
      var jsondata2 = jsonDecode(response.body);
      indianStatesData = jsondata2;
      var i = indianStatesData.length - 1;
      indianStatesData.removeRange(0, i - 35);
    } else {}
  }

  Future<void> getdata() async {
    http.Response response = await http.get(countryURL);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      globalData = jsondata['Global'];
      countryData = jsondata['Countries'];
    } else {}
  }

  Future<void> getDistrictData() async {
    http.Response response1 = await http.get(indianDistrictUrl);
    if (response1.statusCode == 200) {
      jsondata1 = jsonDecode(response1.body);
    } else {
      print(response1.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    this.getdata();
    this.getStatesData();
    this.getDistrictData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Corona Virus Update',
            style: TextStyle(
              fontSize: 25,
            ),
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xfff96BAFF),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Current update on Corona Virus Globally',
                        style: textstyle),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      },
                      child: Text("Click Here", style: textstyle),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xfff96BAFF),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Current update on Corona Virus for all Countries',
                        style: textstyle),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/third');
                      },
                      child: Text("Click Here", style: textstyle),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(0xfff96BAFF),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        'Current update on Corona Virus for India in different district',
                        style: textstyle),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/fifth');
                      },
                      child: Text("Click Here", style: textstyle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
