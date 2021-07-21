// import 'dart:convert';
// import 'package:http/http.dart' as http;

Uri countryURL = Uri.https("api.covid19api.com", "/summary");
var countryData = [];
var globalData;

Uri indianDistrictUrl =
    Uri.https("api.covid19india.org", "/state_district_wise.json");
// var indianDistrictData;

Uri indianStatesUrl =
    Uri.https("api.covid19api.com", "/live/country/India/status/confirmed");
var indianStatesData = [];

var district = [];
var jsondata1;
