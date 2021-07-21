import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class Appointment extends StatefulWidget {
  Appointment({@required this.center_id,@required this.dateTime});
  var center_id;
  var dateTime;
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  var data;
  var userData;
  var urlS;
  int length;
  int p;

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByCenter?center_id=${widget.center_id}&date=${widget.dateTime}"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      data = response.body;
      setState(() {
        userData = jsonDecode(data);
        length = userData['centers']['sessions'].length;
        // print(i);
        // p=i;
      });
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }

    // print(userData);
    // length=userData['centers']['sessions'].length;
    // print(userData['centers']['name']);
    // print(userData['centers']['address']);
    // centers.sessions
    // length=userData['centers']['sessions'].length;
    print(length);
  }

  @override
  void initState() {
    super.initState();
    print(length);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cowin Appointment"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: userData == null ? 0 : length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    side: BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  color: Colors.deepPurple.shade50,
                  shadowColor: Colors.purple,
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // centers.sessions[0].date centers.name
                          SizedBoxes(
                              userDataf: '${userData['centers']['name']}',
                              name: 'Center Name'),
                          SizedBoxes(
                              userDataf: '${userData['centers']['address']}',
                              name: 'Center Address'),
                          SizedBoxes(
                              userDataf:
                                  '${userData['centers']['sessions'][index]['date']}',
                              name: 'Date'),
                          SizedBoxes(
                              userDataf:
                                  '${userData['centers']['sessions'][index]['slots']}',
                              name: 'Slots'),
                          SizedBoxes(
                              userDataf:
                                  '${userData['centers']['sessions'][index]['vaccine']}',
                              name: 'Vaccine Available'),
                          SizedBoxes(
                              userDataf: '${userData['centers']['from']}',
                              name: 'From'),
                          SizedBoxes(
                              userDataf: '${userData['centers']['to']}',
                              name: 'To'),
                          SizedBoxes(
                              userDataf:
                                  '${userData['centers']['sessions'][index]['available_capacity']}',
                              name: 'Available Capacity'),
                          SizedBoxes(
                              userDataf:
                                  '${userData['centers']['sessions'][index]['min_age_limit']}',
                              name: 'Minimum Age Required'),
                          SizedBoxes(
                              userDataf: '${userData['centers']['fee_type']}',
                              name: 'Fees Type'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          FlatButton(
            onPressed: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Book Appointment",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.s,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: RaisedButton(
                    color: Colors.deepPurple.shade50,
                    child: apps_logo(
                      url:
                          'https://play-lh.googleusercontent.com/2FV06dPOPcV-vupN9_9zqPn-pUUio-OzbnqktzIVCdkPcBRRtqo-k63G1DLgIeuJD1np',
                      app_name: 'Aarogya Setu App',
                    ),
                    onPressed: () {
                      openurl(
                        'https://play.google.com/store/apps/details?id=nic.goi.aarogyasetu&hl=en_IN&gl=US',
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: RaisedButton(
                    color: Colors.deepPurple.shade50,
                    child: apps_logo(
                      url:
                          'https://images.firstpost.com/wp-content/uploads/2021/01/cowin-app-1280.jpg?impolicy=website&width=320&height=180',
                      app_name: 'CoWin Website',
                    ),
                    onPressed: () {
                      openurl('https://www.cowin.gov.in/home');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(),
                  child: RaisedButton(
                    color: Colors.deepPurple.shade50,
                    child: apps_logo(
                      url:
                          'https://play-lh.googleusercontent.com/fSnrSVy_LCg9FP3wJcA1cQ1zZLvOO743hZ_Fva2QSi-6H1rUBClqIpdhp59xhiYEtxU',
                      app_name: 'Umang   App',
                    ),
                    onPressed: () {
                      openurl(
                          'https://play.google.com/store/apps/details?id=in.gov.umang.negd.g2c.international&hl=en_IN&gl=US');
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  openurl(String urlS) {
    String url1 = urlS;
    launch(url1);
  }
}

class apps_logo extends StatelessWidget {
  const apps_logo({@required this.url, @required this.app_name});
  final String url;
  final String app_name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage('$url'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          Text(
            '$app_name',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              // color: Colors.orange.shade700,
            ),
          )
        ],
      ),
    );
  }
}

class SizedBoxes extends StatelessWidget {
  const SizedBoxes({@required this.name, @required this.userDataf});
  final String userDataf;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "$name: ",
              style: TextStyle(
                // textBaseline:,
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "$userDataf",
              // maxLines: 150,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ${userData[0]['fee']
