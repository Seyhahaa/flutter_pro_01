class UserRandom {
    final List<Event> docs;
    final int totalDocs;
    final int offset;
    final int limit;
    final int totalPages;
    final int page;
    final int pagingCounter;
    final bool hasPrevPage;
    final bool hasNextPage;
    final dynamic prevPage;
    final int nextPage;

    UserRandom({
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

    factory UserRandom.fromJson(Map<String, dynamic> json) => UserRandom(
        docs: List<Event>.from(json["docs"].map((x) => Event.fromJson(x))),
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

class Event {
    final String id;
    final String title;
    final String address;
    final String category;
    final DateTime date;
    final String description;
    final String images;
    final UploadBy uploadBy;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    Event({
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

    factory Event.fromJson(Map<String, dynamic> json) => Event(
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
    final String id;
    final String firstname;
    final String lastname;
    final String phone;
    final String email;
    final String address;
    final String path;
    final String organization;
    final String position;
    final String role;
    final DateTime dob;
    final String gender;
    final String password;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

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
