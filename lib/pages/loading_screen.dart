import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingPage extends StatefulWidget {
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}
class _LoadingPageState extends State<LoadingPage> {
  var selected;
  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'London', flag: 'britain.png', url: 'Europe/London');
    await instance.getTime();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,'/home', arguments: instance);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitPouringHourGlassRefined(color: Colors.black)
    );
  }
}
