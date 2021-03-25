// To parse this JSON data, do
//
//     final cat = catFromJson(jsonString);

import 'dart:convert';

Cat catFromJson(String str) => Cat.fromJson(json.decode(str));

String catToJson(Cat data) => json.encode(data.toJson());

class Cat {
    Cat({
        this.slug,
        this.name,
    });

    String slug;
    String name;

    factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        slug: json["slug"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
    };
}
