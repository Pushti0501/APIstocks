// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:core';


import 'package:apistockedge/performance.dart';


import 'package:flutter/material.dart';
import 'package:http/http.dart';

import './overview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: APIstockedge(),
    );
  }
}

class APIstockedge extends StatefulWidget {
  const APIstockedge({Key? key}) : super(key: key);

  @override
  State<APIstockedge> createState() => _APIstockedgeState();
}

class _APIstockedgeState extends State<APIstockedge> {


  List performancedata = [];

  

  Future<List<dynamic>> fetchperformance() async {
  
    final response = await get(Uri.parse(
        'https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en'));

    if (response.statusCode == 200) {
    
     
      setState(() {
       
      });
    } else {
      throw Exception('Failed to load data');
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
 
    fetchperformance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor:  const Color(0xFF0b0669),
        title: const Center(child: Text('APIStockedge')),
      ),
      body: SingleChildScrollView(
      
       child:Column(
         // ignore: prefer_const_literals_to_create_immutables
         children: [
           const Overview(),
           const Performance(),
          
         ],
        
       ),
       
        
      ),
     
    );

  }

}
