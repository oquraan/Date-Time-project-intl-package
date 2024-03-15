// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: DateAndTime(),
    );
  }
}

class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  String weekDay = "";
  String date = "";
  String timeNow = "";

  cangeEverySec() {
    Timer t1 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        date = DateFormat.yMMMd().format(DateTime.now());
        weekDay = DateFormat.EEEE().format(DateTime.now());
        timeNow=DateFormat("hh:mm:ss a").format(DateTime.now());
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    cangeEverySec();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time & Date App ",
            style: TextStyle(fontSize: 27, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 57, 73, 80),
      ),
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today Date Is $weekDay",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              date,
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              timeNow,
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
