import '../../models/api2.dart';
import '../../models/country.dart';
import './details.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

int flag = 1;

class CountryReport extends StatefulWidget {
  @override
  _CountryReportState createState() => _CountryReportState();
}

class _CountryReportState extends State<CountryReport> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Country;
    return Scaffold(
      // backgroundColor: HexColor('#5C4C6D'),
      appBar: AppBar(
        title: Center(child: Text("COVID-19")),
      ),
      backgroundColor: HexColor('#7952B3'),
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Text(
                  'Statistics',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //  Navigator.pushNamed(context, '/second');
                        setState(() {
                          flag = 0;
                        });
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 80),
                        child: Text(
                          'Global',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // color =
                        height: 50,
                        // width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xffbC990E4),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //  Navigator.pushNamed(context, '/forth');
                        setState(() {
                          flag = 1;
                        });
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            '${args.name}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (flag == 1)
                Details(
                  active: args.active,
                  affected: args.affected,
                  death: args.death,
                  newdeath: args.newdeath,
                  recovered: args.recovered,
                  flag: flag,
                ),
              if (flag == 0)
                Details(
                  affected: globalData['TotalConfirmed'],
                  death: globalData['TotalDeaths'],
                  recovered: globalData["TotalRecovered"],
                  active: globalData["TotalConfirmed"] -
                      globalData["TotalRecovered"] -
                      globalData["TotalDeaths"],
                  newdeath: globalData["NewDeaths"],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
