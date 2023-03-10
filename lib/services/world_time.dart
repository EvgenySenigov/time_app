import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time = 'default'; //the time in that location
  String flag; //url to an asset flag image
  String url; //location url for api endpoint
  bool isDaytime = true; //true if daytime, false otherwise *true by default
  WorldTime({required this.location, required this.flag, required this.url});
  Future <void> getTime() async {
    try {
      //make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //get properties from data(daytime and offset)
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(0,3);
      DateTime current = DateTime.parse(datetime);
      current = current.add(Duration(hours: int.parse(offset)));
      isDaytime = current.hour > 6 && current.hour < 20 ? true : false;
      this.time = DateFormat.jm().format(current);
      print('done');
    }
    catch (error) {
      print('error caught: $error');
      this.time = 'caught error';
    }
  }
}