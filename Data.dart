import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';



class Data {
    List data = [{'x':'a','z':'b'}];
 getData() async
  {
    Response response = await get('https://api.github.com/users');
    data = jsonDecode(response.body);
  }
  Data()
  {
    print('xyz');
  }
}

