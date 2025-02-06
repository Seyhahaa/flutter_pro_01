// To parse this JSON data, do
//
//     final userRandom = userRandomFromJson(jsonString);

import 'dart:convert';

UserRandom userRandomFromJson(String str) => UserRandom.fromJson(json.decode(str));

String userRandomToJson(UserRandom data) => json.encode(data.toJson());

class UserRandom {
    final List<Item> items;

    UserRandom({
        required this.items,
    });

    factory UserRandom.fromJson(Map<String, dynamic> json) => UserRandom(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    final String id;
    final String title;
    final String qty;
    final String price;
    final String imgUrl;
    final String rate;

    Item({
        required this.id,
        required this.title,
        required this.qty,
        required this.price,
        required this.imgUrl,
        required this.rate,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        qty: json["qty"],
        price: json["price"],
        imgUrl: json["img_url"],
        rate: json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "qty": qty,
        "price": price,
        "img_url": imgUrl,
        "rate": rate,
    };
}
