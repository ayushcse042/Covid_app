import 'package:flutter/material.dart';
import '../../models/api2.dart';
import '../country/details.dart';
import 'package:hexcolor/hexcolor.dart';

class GlobalData extends StatefulWidget {
  @override
  State<GlobalData> createState() => _GlobalDataState();
}

class _GlobalDataState extends State<GlobalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("COVID-19")),
      ),
      backgroundColor: HexColor('#7952B3'),
      body: SingleChildScrollView(
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Global Covid Curent Update',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
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
    );
  }
}
