import 'dart:convert';

import 'package:apideo/send_data.dart';
import 'package:apideo/user_deatail.dart';
import 'package:apideo/webview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key,required this.detailmodel,   }) : super(key: key);


  final UserDetailModel detailmodel ;



  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {










  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
    
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

        

              
             Card(
                   shape: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15),
                     borderSide: BorderSide.none
                   ),
               
                   elevation: 55,
               
                   child: Padding( padding: const EdgeInsets.all(5),
                   
               
               
                   child: Column(children: [
               
                 Text("Name:${widget.detailmodel.data!.data![0].formValue!.yourName.toString()}",),

                 SizedBox(height: 10,),

                            InkWell(
                              onTap: (){


                                
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (_) => WebViewExample(url: widget.detailmodel.data!.data![0].formValue!.yourFilecfdb7File.toString(),)));
                              },
                              
                              child: Text("link:${widget.detailmodel.data!.data![0].formValue!.yourFilecfdb7File.toString()}",)),




                              ElevatedButton(onPressed: (){

                                  Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (_) => SendData
                                    ()));
                                


                              }, child: Text('Reply'))
               
                 
               
               
               
                   ]),
                   
                   
                   ))
            ],

            
            

          ),
        
        
        
        ),
      ),
    );
  }
}