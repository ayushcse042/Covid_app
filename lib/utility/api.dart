import 'package:flutter/cupertino.dart';
import 'networking.dart';

class CenterModel {
  CenterModel({@required this.pinCode,@required this.dateTime});
  var pinCode;
  dynamic dateTime;
  Future getCenterInfo() async
  {
    //https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=854329&date=12-06-2021
    Uri myUri = Uri.parse('https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=$pinCode&date=$dateTime');
    NetworkHelper networkHelper = NetworkHelper(myUri);
    var Data = await networkHelper.getData();
    return Data;

  }
  Future getInfo() async
  {
    //https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id=74&date=29-06-2021
    Uri myUri = Uri.parse('https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id=$pinCode&date=$dateTime');
    NetworkHelper networkHelper = NetworkHelper(myUri);
    var Data = await networkHelper.getData();
    return Data;
  }
}
