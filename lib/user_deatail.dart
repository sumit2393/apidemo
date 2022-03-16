// To parse this JSON data, do
//
//     final userDetailModel = userDetailModelFromJson(jsonString);

import 'dart:convert';

UserDetailModel userDetailModelFromJson(String str) => UserDetailModel.fromJson(json.decode(str));

String userDetailModelToJson(UserDetailModel data) => json.encode(data.toJson());

class UserDetailModel{
    UserDetailModel({
        this.success,
        this.statusCode,
        this.code,
        this.message,
        this.data,
        this.reply,
    });

    bool? success;
    int? statusCode;
    int? code;
    String? message;
    Data? data;
    Reply? reply;

    factory UserDetailModel.fromJson(Map<String, dynamic> json) => UserDetailModel(
        success: json["success"],
        statusCode: json["statusCode"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        reply: Reply.fromJson(json["reply"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "code": code,
        "message": message,
        "data": data!.toJson(),
        "reply": reply!.toJson(),
    };
}

class Data {
    Data({
        this.data,
    });

    List<DetailData>? data;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<DetailData>.from(json["data"].map((x) => DetailData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DetailData {
    DetailData({
        this.id,
        this.formPostId,
        this.formDate,
        this.formValue,
    });

    String? id;
    String? formPostId;
    String? formDate;
    FormValue? formValue;

    factory DetailData.fromJson(Map<String, dynamic> json) => DetailData(
        id: json["id"],
        formPostId: json["form_post_id"],
        formDate: json["form_date"],
        formValue: FormValue.fromJson(json["form_value"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "form_post_id": formPostId,
        "form_date": formDate,
        "form_value": formValue!.toJson(),
    };
}

class FormValue {
    FormValue({
        this.cfdb7Status,
        this.yourName,
        this.yourEmail,
        this.yourSubject,
        this.yourMessage,
        this.yourFilecfdb7File,
    });

    String? cfdb7Status;
    String? yourName;
    String? yourEmail;
    String? yourSubject;
    String? yourMessage;
    String? yourFilecfdb7File;

    factory FormValue.fromJson(Map<String, dynamic> json) => FormValue(
        cfdb7Status: json["cfdb7_status"],
        yourName: json["your-name"],
        yourEmail: json["your-email"],
        yourSubject: json["your-subject"],
        yourMessage: json["your-message"],
        yourFilecfdb7File: json["your-filecfdb7_file"],
    );

    Map<String, dynamic> toJson() => {
        "cfdb7_status": cfdb7Status,
        "your-name": yourName,
        "your-email": yourEmail,
        "your-subject": yourSubject,
        "your-message": yourMessage,
        "your-filecfdb7_file": yourFilecfdb7File,
    };
}

class Reply {
    Reply({
        this.data,
    });

    List<dynamic>? data;

    factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        data: List<dynamic>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x)),
    };
}
