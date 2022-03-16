import 'dart:convert';

import 'package:apideo/home.dart';
import 'package:apideo/show_deatiail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:apideo/user_deatail.dart';
import 'package:apideo/user_model.dart';
import 'package:flutter/material.dart';

class Datapage extends StatefulWidget {
  Datapage({Key? key, required this.listData}) : super(key: key);

  final List<Datum>? listData;

  @override
  State<Datapage> createState() => _DatapageState();
}

class _DatapageState extends State<Datapage> {
  List<DetailData>? listDetialdata;

  UserDetailModel detailmodel = UserDetailModel();

  bool isloading = true;

  @override
  void initState() {
    super.initState();
  }

  Future<UserDetailModel> getdetail() async {
    isloading = true;

    final response = await http.post(
        Uri.parse(
            'http://demo6.sphinxworldbiz.net/wpapi/wp-json/jwt-auth/v1/enquiry-detail'),
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZW1vNi5zcGhpbnh3b3JsZGJpei5uZXRcL3dwYXBpIiwiaWF0IjoxNjQ2ODg2OTg3LCJuYmYiOjE2NDY4ODY5ODcsImV4cCI6MTY0NzQ5MTc4NywiZGF0YSI6eyJ1c2VyIjp7ImlkIjoxLCJkZXZpY2UiOiIiLCJwYXNzIjoiZjYwMzc4YWViNGRkYTc1YzZkM2QzZjMwMjg4ZTFkN2YifX19.IUgliwz0zH8XJey-VYKcMkWaOWuwlm9-luRzp9DEXlo'
        },
        body: {
          "id": "13"
        });
    if (response.body.isNotEmpty) {
      print(response.body);

      return userDetailModelFromJson(response.body);
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: widget.listData!.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                elevation: 55,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () async {},
                    child: Column(children: [
                      Text(
                        "Name:${widget.listData![index].formValue.yourName}",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "date:${widget.listData![index].formDate.toString()}",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "subject:${widget.listData![index].formValue.yourSubject}",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "subject:${widget.listData![index].formValue.yourMessage}",
                      ),
                      InkWell(
                          child: Text(
                        "subject:${widget.listData![index].formValue.yourFilecfdb7File}",
                      )),
                      ElevatedButton(
                          onPressed: () async {
                            detailmodel = await getdetail();

                

                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (_) => DetailScreen(
                                          detailmodel: detailmodel,
                                        )));
                          },
                          child: Text('show detail'))
                    ]),
                  ),
                )),
          ],
        );
      },
    ));
  }
}
