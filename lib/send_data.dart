import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendData extends StatefulWidget {
  SendData({Key? key}) : super(key: key);

  @override
  State<SendData> createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {
  FilePickerResult? result;

  TextEditingController _message = TextEditingController();

  bool isloading = false;

  Future<void> postdetail() async {
    final response = await http.post(
        Uri.parse(
            'http://demo6.sphinxworldbiz.net/wpapi/wp-json/jwt-auth/v1/reply'),
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9kZW1vNi5zcGhpbnh3b3JsZGJpei5uZXRcL3dwYXBpIiwiaWF0IjoxNjQ2ODg2OTg3LCJuYmYiOjE2NDY4ODY5ODcsImV4cCI6MTY0NzQ5MTc4NywiZGF0YSI6eyJ1c2VyIjp7ImlkIjoxLCJkZXZpY2UiOiIiLCJwYXNzIjoiZjYwMzc4YWViNGRkYTc1YzZkM2QzZjMwMjg4ZTFkN2YifX19.IUgliwz0zH8XJey-VYKcMkWaOWuwlm9-luRzp9DEXlo'
        },
        body: {
          "form_id": "14",
          "reply_text": _message.text.toString(),
          "file": result.toString(),
        });
    if (response.body.isNotEmpty) {
      print(response.body);
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: _message,
          decoration: InputDecoration(labelText: 'enter meesage'),
        ),
        ElevatedButton(
            onPressed: () async {
              result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'pdf', 'doc'],
              );

              setState(() {});
            },
            child: Text('pick Data')),
        SizedBox(
          height: 5,
        ),
        isloading == false
            ? result != null
                ? ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isloading = true;
                      });

                      await postdetail();

                      setState(() {
                        isloading = false;
                      });
                    },
                    child: Text('send data'))
                : Text(' Please selectfile')
            : Center(
                child: CircularProgressIndicator(),
              )
      ]),
    ));
  }
}
