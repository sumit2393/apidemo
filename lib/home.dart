import 'dart:convert';

import 'package:apideo/showdata.dart';
import 'package:apideo/user_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {

 UserList? listData;

 List<Datum>? data;
  Future <UserList?> fetchData() async {
    final response =
    await http.get(Uri.parse('http://demo6.sphinxworldbiz.net/wpapi/wp-json/jwt-auth/v1/enquiry-list'),
    
    headers: {
    
      'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZW1vNi5zcGhpbnh3b3JsZGJpei5uZXRcL3dwYXBpIiwiaWF0IjoxNjQ2ODg2OTg3LCJuYmYiOjE2NDY4ODY5ODcsImV4cCI6MTY0NzQ5MTc4NywiZGF0YSI6eyJ1c2VyIjp7ImlkIjoxLCJkZXZpY2UiOiIiLCJwYXNzIjoiZjYwMzc4YWViNGRkYTc1YzZkM2QzZjMwMjg4ZTFkN2YifX19.IUgliwz0zH8XJey-VYKcMkWaOWuwlm9-luRzp9DEXlo'
          
    },

  
    
    
    );
    if (response.body.isNotEmpty) {
   
      var jsonResponse = json.decode(response.body);
      var jsons= jsonResponse['data']['data'];

     
      return userListFromJson(response.body);


    } else {
      throw Exception('Unexpected error occured!');
    }
  }

@override
  void initState() {
    // TODO: implement initState
    // lisData=fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
    
        children: [
    
          TextButton(onPressed: ()async{
    
            listData=await fetchData();

            data=listData!.data.data;


         
    
    
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Datapage(listData: data)));
    
            
    
    
    
    
          }, child: Text('Show Data'))
    
    
        ],
      ),
    );
  }
}
