import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading_screen.dart';
import 'package:world_time/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/loading' : (context) => LoadingPage(),
      '/home' : (context) => HomePage(),
      '/location' : (context) => ChooseLocation(),
      '/' : (context) => ChooseLocation()
    },
  ));
}

