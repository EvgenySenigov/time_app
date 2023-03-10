import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var received;
  @override
  Widget build(BuildContext context) {
    received = ModalRoute.of(context)!.settings.arguments;
    String backgroundImage = received.isDaytime ? 'day.png' : 'night.png';
    Color? backgroundColor = received.isDaytime ? Colors.lightBlueAccent : Colors.blue[900];
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$backgroundImage'),
                  fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 185.0),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                    label: Text('Choose Location', style: TextStyle(color: Colors.grey[200]))
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(received.location, style: TextStyle(fontSize: 27.0, letterSpacing: 3.0, color: Colors.grey[200]))
                  ],
                ),
                SizedBox(height: 20.0),
                Text(received.time, style: TextStyle(fontSize: 32.0, letterSpacing: 3.0, color: Colors.grey[200]))
              ],
            ),
          )
      ),
    );
  }
}
