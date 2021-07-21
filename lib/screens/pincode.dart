import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import '../utility/rounded_button.dart';
import '../centers.dart';
class Pincode extends StatefulWidget {
  @override
  _PincodeState createState() => _PincodeState();
}

class _PincodeState extends State<Pincode> {
  DateTime selectedDate = DateTime.now();
  var formattedDate;
  var pinCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 3.0, 5.0, 3.0),
                      child: Row(
                        children: [
                          Text('Pincode',
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
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.post_add),
                              labelText: 'Enter PinCode',
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              pinCode=value;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 6.0, 5.0, 3.0),
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
                          DateTimeFormField(
                            dateFormat: new DateFormat('dd-MM-yyyy kk:mm:a'),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.event_note),
                              labelText: 'Enter The Date And Time',
                            ),
                            autovalidateMode: AutovalidateMode.always,
                            // validator: (e) =>
                            // (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                            onDateSelected: (DateTime value) {
                              formattedDate = "${value.day}-${value.month}-${value.year}";
                              print (formattedDate);
                            },
                          ),
                          const SizedBox(height: 50),
                          RoundedButton(color:Colors.lightBlueAccent,text: 'Submit',onPressed: ()async
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return VaccinationCenter(pin: pinCode,date: formattedDate,index: 0);
                            },),);
                          },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

