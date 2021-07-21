import 'package:flutter/cupertino.dart';

import 'networking.dart';

class districtModel {
  districtModel({@required this.id});
  var id;
  Future getInfo() async
  {
    Uri myUri = Uri.parse('https://cdn-api.co-vin.in/api/v2/admin/location/districts/$id');
    NetworkHelper networkHelper = NetworkHelper(myUri);
    var Data = await networkHelper.getData();
    return Data;
  }
}
