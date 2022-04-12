import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'Data.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home:Home()
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [{'x':'a','z':'b'}];
  void setupData() async {
    Data instance = Data();
    await instance.getData();
    setState(() {
      data = instance.data;
    });
  }

  @override
  void initState() {
    super.initState();
    setupData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text('Users',
        style: TextStyle(
        ),),
      ),
      body:
      SingleChildScrollView(
       child: Center(
           child: Column(
               children: data.map((user)
               {
                 return SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Card(
                     margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                     color: Colors.limeAccent[700],
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         for(var k in user.keys)
                           Padding(
                             padding: EdgeInsets.all(5.0),
                             child: Row(
                               children: [
                                 Text(
                                     '$k :',
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                 ),),
                                 Text(' ${user[k]}',
                                 style: TextStyle(
                                   fontFamily: 'LobsterRegular',
                                   fontSize: 15.0
                                 ),
                                 )
                               ],
                             ),
                           )
                       ],
                     ),
                   ),
                 );
               }).toList())
       ),

      )
    );
  }
}







