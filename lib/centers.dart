import 'package:covidify/screens/Appointment.dart';
import 'utility/api.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class VaccinationCenter extends StatefulWidget {
  VaccinationCenter({this.pin, this.date, this.index});
  final int index;
  var pin;
  final dynamic date;
  @override
  _VaccinationCenterState createState() => _VaccinationCenterState();
}

class _VaccinationCenterState extends State<VaccinationCenter> {
  var caseData;
  var url;
  Future<String> getLocationData() async {
    CenterModel center =
        CenterModel(pinCode: widget.pin, dateTime: widget.date);
    if (widget.index == 0)
      caseData = await center.getCenterInfo();
    else {
      caseData = await center.getInfo();
      print("omkar");
    }
    setState(() {
      caseData = jsonDecode(caseData);
      print(caseData["sessions"][0]["name"]);
    });
    return "success";
  }

  @override
  void initState() {
    super.initState();
    this.getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Available Center"),
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: caseData == null ? 0 : caseData["sessions"].length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 120,
                margin: EdgeInsets.all(4.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  color: Colors.deepPurple.shade50,
                  shadowColor: Colors.purple,
                  child: TextButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            //sessions[0].center_id
                            print(caseData["sessions"][index]["center_id"]);
                            return Appointment(
                                center_id: caseData["sessions"][index]
                                    ["center_id"],
                                dateTime: widget.date);
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  caseData["sessions"][index]["name"],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  caseData["sessions"][index]["address"],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  caseData["sessions"][index]["state_name"] +
                                      " " +
                                      caseData["sessions"][index]["pincode"]
                                          .toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12, right: 12.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Dose 1: " +
                                        caseData["sessions"][index]
                                                ["available_capacity_dose1"]
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: SizedBox(),
                                  ),
                                  Text(
                                    "Dose 2: " +
                                        caseData["sessions"][index]
                                                ["available_capacity_dose2"]
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ))
        ]));
  }
}
