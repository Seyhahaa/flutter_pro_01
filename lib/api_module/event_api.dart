// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    List<Doc> docs;
    int totalDocs;
    int offset;
    int limit;
    int totalPages;
    int page;
    int pagingCounter;
    bool hasPrevPage;
    bool hasNextPage;
    dynamic prevPage;
    dynamic nextPage;

    Welcome({
        required this.docs,
        required this.totalDocs,
        required this.offset,
        required this.limit,
        required this.totalPages,
        required this.page,
        required this.pagingCounter,
        required this.hasPrevPage,
        required this.hasNextPage,
        required this.prevPage,
        required this.nextPage,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
        totalDocs: json["totalDocs"],
        offset: json["offset"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        page: json["page"],
        pagingCounter: json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"],
        hasNextPage: json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
        "totalDocs": totalDocs,
        "offset": offset,
        "limit": limit,
        "totalPages": totalPages,
        "page": page,
        "pagingCounter": pagingCounter,
        "hasPrevPage": hasPrevPage,
        "hasNextPage": hasNextPage,
        "prevPage": prevPage,
        "nextPage": nextPage,
    };
}

class Doc {
    String id;
    String title;
    String address;
    String category;
    DateTime date;
    String description;
    String images;
    UploadBy uploadBy;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Doc({
        required this.id,
        required this.title,
        required this.address,
        required this.category,
        required this.date,
        required this.description,
        required this.images,
        required this.uploadBy,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        id: json["_id"],
        title: json["title"],
        address: json["address"],
        category: json["category"],
        date: DateTime.parse(json["date"]),
        description: json["description"],
        images: json["images"],
        uploadBy: UploadBy.fromJson(json["uploadBy"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "address": address,
        "category": category,
        "date": date.toIso8601String(),
        "description": description,
        "images": images,
        "uploadBy": uploadBy.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class UploadBy {
    String id;
    String firstname;
    String lastname;
    String phone;
    String email;
    String address;
    String path;
    String organization;
    String position;
    String role;
    DateTime dob;
    String gender;
    String password;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    UploadBy({
        required this.id,
        required this.firstname,
        required this.lastname,
        required this.phone,
        required this.email,
        required this.address,
        required this.path,
        required this.organization,
        required this.position,
        required this.role,
        required this.dob,
        required this.gender,
        required this.password,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory UploadBy.fromJson(Map<String, dynamic> json) => UploadBy(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        path: json["path"],
        organization: json["organization"],
        position: json["position"],
        role: json["role"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "email": email,
        "address": address,
        "path": path,
        "organization": organization,
        "position": position,
        "role": role,
        "dob": dob.toIso8601String(),
        "gender": gender,
        "password": password,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
