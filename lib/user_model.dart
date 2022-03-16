import 'dart:convert';

UserList userListFromJson(String str) => UserList.fromJson(json.decode(str));

String userListToJson(UserList data) => json.encode(data.toJson());

class UserList {
  UserList({
    required this.success,
    required this.statusCode,
    required this.code,
    required this.message,
    required this.data,
  });

  bool success;
  int statusCode;
  int code;
  String message;
  DataModel data;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
    success: json["success"],
    statusCode: json["statusCode"],
    code: json["code"],
    message: json["message"],
    data: DataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class DataModel {
  DataModel({
    required this.data,
  });

  List<Datum> data;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}




class Datum {
  Datum({
    required this.id,
    required this.formPostId,
    required this.formDate,
    required this.formValue,
  });

  String id;
  String formPostId;
  DateTime formDate;
  FormValue formValue;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    formPostId: json["form_post_id"],
    formDate: DateTime.parse(json["form_date"]),
    formValue: FormValue.fromJson(json["form_value"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "form_post_id": formPostId,
    "form_date": formDate.toIso8601String(),
    "form_value": formValue.toJson(),
  };
}

class FormValue {
  FormValue({
    required this.cfdb7Status,
    required this.yourName,
    required this.yourEmail,
    required this.yourSubject,
    required this.yourMessage,
    required this.yourFilecfdb7File,
  });

  dynamic cfdb7Status;
  dynamic yourName;
  dynamic yourEmail;
  dynamic yourSubject;
  dynamic yourMessage;
  dynamic yourFilecfdb7File;

  factory FormValue.fromJson(Map<String, dynamic> json) => FormValue(
    cfdb7Status: cfdb7StatusValues.map[json["cfdb7_status"]],
    yourName: yourNameValues.map[json["your-name"]],
    yourEmail: yourEmailValues.map[json["your-email"]],
    yourSubject: yourSubjectValues.map[json["your-subject"]],
    yourMessage: json["your-message"],
    yourFilecfdb7File: json["your-filecfdb7_file"] == null ? null : json["your-filecfdb7_file"],
  );

  Map<String, dynamic> toJson() => {
    "cfdb7_status": cfdb7StatusValues.reverse[cfdb7Status],
    "your-name": yourNameValues.reverse[yourName],
    "your-email": yourEmailValues.reverse[yourEmail],
    "your-subject": yourSubjectValues.reverse[yourSubject],
    "your-message": yourMessage,
    "your-filecfdb7_file": yourFilecfdb7File == null ? null : yourFilecfdb7File,
  };
}

enum Cfdb7Status { UNREAD }

final cfdb7StatusValues = EnumValues({
  "unread": Cfdb7Status.UNREAD
});

enum YourEmail { YASH8351_GMAIL_COM, DFSFSD_GMAIL_COM }

final yourEmailValues = EnumValues({
  "dfsfsd@gmail.com": YourEmail.DFSFSD_GMAIL_COM,
  "yash8351@gmail.com": YourEmail.YASH8351_GMAIL_COM
});

enum YourName { SHIV_KUMAR }

final yourNameValues = EnumValues({
  "Shiv Kumar": YourName.SHIV_KUMAR
});

enum YourSubject { TEST_F_ILE, TEST_MESSAGE, TEST }

final yourSubjectValues = EnumValues({
  "Test": YourSubject.TEST,
  "Test FIle": YourSubject.TEST_F_ILE,
  "Test message": YourSubject.TEST_MESSAGE
});

class EnumValues<T> {
  late Map<String, T> map;
   late Map<T, String> reverseMap;

   EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
