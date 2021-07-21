import 'package:covidify/utility/districtApi.dart';
import 'package:flutter/material.dart';
import 'package:covidify/utility/stateApi.dart';
import 'dart:convert';
import 'package:covidify/Listitem.dart';
import '../utility/rounded_button.dart';
import '../centers.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
class District extends StatefulWidget {
  @override
  _DistrictState createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  var _state;
  var caseData;
  var data;
  var _district;
  DateTime selectedDate = DateTime.now();
  var formattedDate;
  List<ListItem> _dropdownStateItems=[];
  List<ListItem> _dropdownDistrictItems=[];
  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items=List() ;
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }
  Future<String> getStateData() async
  {
    stateModel center = stateModel();
    caseData = await center.getInfo();
    setState(() {
      caseData= jsonDecode(caseData);
          for(int i=0;i<caseData["states"].length;i++) {
            _dropdownStateItems.insert(i,ListItem(caseData["states"][i]['state_id'],(caseData["states"][i]['state_name'])));
            //print((caseData['states'][i]['state_name']));
          }
    });
    return "success";
  }
  Future<String> getDistrictData() async
  {
    districtModel center1 = districtModel(id:_state.value);
    data = await center1.getInfo();
    setState(() {
      data= jsonDecode(data);
      for(int i=0;i<data["districts"].length;i++) {
        _dropdownDistrictItems.insert(i,ListItem(data["districts"][i]['district_id'],(data["districts"][i]['district_name'])));
      }
    });
    return "success";
  }
  @override
  void initState() {
    super.initState();
    this.getStateData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Center(
              child: Container(
                  width: double.infinity,
                  //height: 500,
                  child: Column(
                      children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 3.0, 5.0, 3.0),
                      child: Row(
                        children: [
                          Text('Select State',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        Text(' *',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.red)
                        ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 3.0, 5.0, 3.0),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(15.0, 3.0, 5.0, 3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ListItem>(
                              value: _state,
                              items: buildDropDownMenuItems(_dropdownStateItems),
                              onChanged: (value) {
                                setState((){
                                  _state = value;
                                  print(_state.value);
                                });
                                getDistrictData();
                              },
                              hint: Text("Select State"),
                              ),
                        ),
                        ),
                    ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 3.0, 5.0, 3.0),
                          child: Row(
                            children: [
                              Text('Select District Name',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.red)
                              ),
                            ],
                          ),
                        ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 3.0, 5.0, 3.0),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(15.0, 3.0, 5.0, 3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<ListItem>(
                            value: _district,
                            items: buildDropDownMenuItems(_dropdownDistrictItems),
                            onChanged: (value) {
                              setState(() {
                                _district = value;
                                print(_district.value);
                                // getDistrictData();
                              });
                            },
                            hint: Text("Select District"),
                          ),
                        ),
                      ),
                    ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 3.0, 5.0, 3.0),
                          child: Row(
                            children: [
                              Text('Select Date',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.red)
                              ),
                            ],
                          ),
                        ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 3.0, 5.0, 3.0),
                      child: DateTimeFormField(
                        dateFormat: new DateFormat('dd-MM-yyyy kk:mm:a'),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note),
                          labelText: 'Select Date And Time',
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        // validator: (e) =>
                        // (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                        onDateSelected: (DateTime value) {
                          formattedDate = "${value.day}-${value.month}-${value.year}";
                          print (formattedDate);
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    RoundedButton(color:Colors.lightBlueAccent,text: 'Submit',onPressed: ()async
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return VaccinationCenter(pin: _district.value,date: formattedDate,index: 1);
                      },),);
                    },
                    ),
                  ]
                  ),
              ),
            ),
          ]
          ),
      ),
    );
  }
}
