import 'networking.dart';

class stateModel {
  Future getInfo() async
  {
    Uri myUri = Uri.parse('https://cdn-api.co-vin.in/api/v2/admin/location/states');
    NetworkHelper networkHelper = NetworkHelper(myUri);
    var Data = await networkHelper.getData();
    return Data;
  }
}
