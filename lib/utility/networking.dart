import 'package:http/http.dart ' as http;

class NetworkHelper
{
  NetworkHelper(this.url);
  var  url;
  Future getData() async
  {
    http.Response response= await http.get(url, headers: {
      "Accept": "application/json"
    } );
    if(response.statusCode==200)
    {
        return response.body;
    }
    else
      print(response.statusCode);
  }
}